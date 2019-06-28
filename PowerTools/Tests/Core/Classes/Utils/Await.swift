//
//  Await.swift
//  PowerToolsTester
//
//  Created by Andrea Altea on 27/06/2019.
//

import Foundation
import XCTest

public extension XCTestCase {
    
    struct PowerToolsTester {
        var base: XCTestCase
        
        public func wait(_ timeInterval: TimeInterval, queue: DispatchQueue = .main, exec: @escaping () -> Void) {
            
            let expect = base.expectation(description: "await")
            queue.asyncAfter(deadline: .now() + timeInterval) {
                exec()
                expect.fulfill()
            }
            base.wait(for: [expect], timeout: timeInterval + 1.0)
        }
    }
    
    var tester: PowerToolsTester {
        return PowerToolsTester(base: self)
    }
}
