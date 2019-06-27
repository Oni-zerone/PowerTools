//
//  Await.swift
//  PowerToolsTester
//
//  Created by Andrea Altea on 27/06/2019.
//

import Foundation
import XCTest

public extension XCTestCase {
    
    func await(_ timeInterval: TimeInterval, queue: DispatchQueue = .main, exec: @escaping () -> Void) {
        
        let expect = expectation(description: "await")
        queue.asyncAfter(deadline: .now() + timeInterval) {
            exec()
            expect.fulfill()
        }
        wait(for: [expect], timeout: timeInterval + 1.0)
    }
}
