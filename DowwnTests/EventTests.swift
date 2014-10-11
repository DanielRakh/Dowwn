//
//  EventTests.swift
//  Dowwn
//
//  Created by Daniel on 10/8/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import Foundation
import XCTest

class EventTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    
    func testEventHasTheUserThatCreatedIt () {
        let user = User(name: "Daniel")
        let event = Event(fromUser:user)
        
        XCTAssertEqual(user, event.creator!, "The creator of the event should be the user that created it")
    }

}
