//
//  ViewTests.swift
//  PowerTools_Tests
//
//  Created by Andrea Altea on 20/05/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
import PowerTools

class ViewTests: XCTestCase {

    var containerView: UIView!
    
    override func setUp() {
        
        self.containerView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 100)))
    }

    override func tearDown() {
        self.containerView = nil
    }

    func testAttachFill() {
        let subView = UIView(frame: .zero)
        subView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(subView)
        containerView.attach(view: subView, in: .fill)
        containerView.layoutIfNeeded()

        XCTAssert(subView.bounds == containerView.bounds)
        let verticalConstraints = self.containerView.constraints
        XCTAssert(verticalConstraints.count == 4)
        XCTAssert(verticalConstraints.contains(where: { constraint -> Bool in
            return constraint.firstAttribute == .top && constraint.secondAttribute == .top
        }))
        XCTAssert(verticalConstraints.contains(where: { constraint -> Bool in
            return constraint.firstAttribute == .bottom && constraint.secondAttribute == .bottom
        }))
        XCTAssert(verticalConstraints.contains(where: { constraint -> Bool in
            return constraint.firstAttribute == .left && constraint.secondAttribute == .left
        }))
        XCTAssert(verticalConstraints.contains(where: { constraint -> Bool in
            return constraint.firstAttribute == .right && constraint.secondAttribute == .right
        }))
    }
    
    func testAttachTop() {
        let subView = UIView(frame: .zero)
        subView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(subView)
        containerView.attach(view: subView, in: .top)
        containerView.layoutIfNeeded()
        
        XCTAssert(subView.bounds == CGRect(origin: .zero,
                                           size: CGSize(width: self.containerView.bounds.width, height: 0)))
        let verticalConstraints = self.containerView.constraints
        XCTAssert(verticalConstraints.count == 3)
        XCTAssert(verticalConstraints.contains(where: { constraint -> Bool in
            return constraint.firstAttribute == .top && constraint.secondAttribute == .top
        }))
        XCTAssert(verticalConstraints.contains(where: { constraint -> Bool in
            return constraint.firstAttribute == .left && constraint.secondAttribute == .left
        }))
        XCTAssert(verticalConstraints.contains(where: { constraint -> Bool in
            return constraint.firstAttribute == .right && constraint.secondAttribute == .right
        }))
    }

    func testAttachBottom() {
        let subView = UIView(frame: .zero)
        subView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(subView)
        containerView.attach(view: subView, in: .bottom)
        containerView.layoutIfNeeded()
        
        XCTAssert(subView.bounds == CGRect(origin: .zero, size: CGSize(width: self.containerView.bounds.width, height: 0)))
        let verticalConstraints = self.containerView.constraints
        XCTAssert(verticalConstraints.count == 3)
        XCTAssert(verticalConstraints.contains(where: { constraint -> Bool in
            return constraint.firstAttribute == .bottom && constraint.secondAttribute == .bottom
        }))
        XCTAssert(verticalConstraints.contains(where: { constraint -> Bool in
            return constraint.firstAttribute == .left && constraint.secondAttribute == .left
        }))
        XCTAssert(verticalConstraints.contains(where: { constraint -> Bool in
            return constraint.firstAttribute == .right && constraint.secondAttribute == .right
        }))
    }

    func testAttachLeft() {
        let subView = UIView(frame: .zero)
        subView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(subView)
        containerView.attach(view: subView, in: .left)
        containerView.layoutIfNeeded()
        
        XCTAssert(subView.bounds == CGRect(origin: .zero,
                                           size: CGSize(width: 0, height: self.containerView.bounds.height)))
        let verticalConstraints = self.containerView.constraints
        XCTAssert(verticalConstraints.count == 3)
        XCTAssert(verticalConstraints.contains(where: { constraint -> Bool in
            return constraint.firstAttribute == .bottom && constraint.secondAttribute == .bottom
        }))
        XCTAssert(verticalConstraints.contains(where: { constraint -> Bool in
            return constraint.firstAttribute == .left && constraint.secondAttribute == .left
        }))
        XCTAssert(verticalConstraints.contains(where: { constraint -> Bool in
            return constraint.firstAttribute == .top && constraint.secondAttribute == .top
        }))
    }

    func testAttachRight() {
        let subView = UIView(frame: .zero)
        subView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(subView)
        containerView.attach(view: subView, in: .right)
        containerView.layoutIfNeeded()
        
        XCTAssert(subView.bounds == CGRect(origin: .zero,
                                           size: CGSize(width: 0, height: self.containerView.bounds.height)))
        let verticalConstraints = self.containerView.constraints
        XCTAssert(verticalConstraints.count == 3)
        XCTAssert(verticalConstraints.contains(where: { constraint -> Bool in
            return constraint.firstAttribute == .bottom && constraint.secondAttribute == .bottom
        }))
        XCTAssert(verticalConstraints.contains(where: { constraint -> Bool in
            return constraint.firstAttribute == .top && constraint.secondAttribute == .top
        }))
        XCTAssert(verticalConstraints.contains(where: { constraint -> Bool in
            return constraint.firstAttribute == .right && constraint.secondAttribute == .right
        }))
    }

}
