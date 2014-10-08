//
//  UserTests.swift
//  Dowwn
//
//  Created by Daniel on 10/8/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import Foundation
import XCTest

class UserTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testUserHasAName() {
        let user = User.init(name:"Daniel")
        XCTAssertEqual(user.name!, "Daniel", "User should always have a name")
    }

}
