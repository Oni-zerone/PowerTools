//
//  AbstractFactoryTests.swift
//  PowerTools_Tests
//
//  Created by Andrea Altea on 09/12/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import PowerTools

class AbstractFactoryTests: XCTestCase {

    var window: UIWindow!
    var controller: NavigationFactory!
    
    override func setUp() {
        self.window = UIWindow(frame: CGRect(origin: .zero, size: CGSize(width: 300, height: 1024)))
        self.controller = NavigationFactory(context: "FactoryString", rootController: UIViewController())
        self.window.rootViewController = self.controller
        self.window.makeKeyAndVisible()
    }

    override func tearDown() {

        self.window.resignKey()
        self.controller = nil
    }

    func testMakeController() {

        let controller = self.controller.make(from: DummyBuilder())
        XCTAssert(controller?.title == self.controller.context)
    }
    
    func testShowController() {
     
        self.controller.showVC(from: DummyBuilder(), sender: self.controller)
        let exp = self.expectation(description: "show")
        exp.isInverted = true
        wait(for: [exp], timeout: 1.0)
        XCTAssert(self.controller.visibleViewController?.title == self.controller.context)
    }
    
    func testPresentController() {

        let exp = expectation(description: "presentedController")
        self.controller.presentVC(from: DummyBuilder(), animated: true) {
            exp.fulfill()
            XCTAssert(self.controller.presentedViewController?.title == self.controller.context)
        }
        wait(for: [exp], timeout: 1.0)
    }

    func testShowEmptyController() {
        
        self.controller.showVC(from: Builder<String>(), sender: self.controller)
        let exp = self.expectation(description: "show")
        exp.isInverted = true
        wait(for: [exp], timeout: 1.0)
        XCTAssert(self.controller.childViewControllers.count == 1)
    }
    
    func testPresentEmptyController() {
        
        let exp = expectation(description: "presentedController")
        exp.isInverted = true
        self.controller.presentVC(from: Builder<String>(), animated: true) {
            exp.fulfill()
            XCTAssert(self.controller.presentedViewController == nil)
        }
        wait(for: [exp], timeout: 1.0)
    }

    func testShowControllerFromContainer() {
        
        self.controller.showVC(from: DummyContainer())
        let exp = self.expectation(description: "show")
        exp.isInverted = true
        wait(for: [exp], timeout: 1.0)
        XCTAssert(self.controller.visibleViewController?.title == self.controller.context)
    }
    
    func testPresentControllerFromContainer() {
        
        var container = DummyContainer()
        container.shouldPresentModally = true
        self.controller.showVC(from: container)
        let exp = self.expectation(description: "present")
        exp.isInverted = true
        wait(for: [exp], timeout: 1.0)
        XCTAssert(self.controller.presentedViewController?.title == self.controller.context)
    }

    func testShowControllerFromEmptyContainer() {
        
        self.controller.showVC(from: EmptyContainer())
        let exp = self.expectation(description: "show")
        exp.isInverted = true
        wait(for: [exp], timeout: 1.0)
        XCTAssert(self.controller.childViewControllers.count == 1)
    }
}

class NavigationFactory: UINavigationController, AbstractFactory {

    var context: String
    
    init(context: String, rootController: UIViewController) {
        self.context = context
        super.init(rootViewController: rootController)
        self.context = context
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        self.context = ""
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.context = ""
        super.init(coder: aDecoder)
    }
}

class DummyBuilder: Builder<String> {
    
    override func build(_ context: String) -> UIViewController? {
        let controller = UIViewController()
        controller.title = context
        return controller
    }
}

struct DummyContainer: BuilderContainer {

    var shouldPresentModally: Bool = false
    
    func getBuilder<Context>(_ contextType: Context.Type) -> Builder<Context>? {
        return DummyBuilder() as? Builder<Context>
    }
}

struct EmptyContainer: BuilderContainer {
    
    func getBuilder<Context>(_ contextType: Context.Type) -> Builder<Context>? {
        return nil
    }
}
