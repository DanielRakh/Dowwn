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

    var user:User!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        user = User.init(name:"Daniel")
    }
    
    func testUserMustHaveAName() {
        XCTAssertEqual(user.name, "Daniel", "User should always have a name")
    }
    
    func testUserCanHaveNoEventsCreated() {
        XCTAssert(user.eventsCreated.count == 0, "User should be able to have no events")
    }
    
    func testUserCanHaveEventsCreated() {
        var events = NSMutableArray(objects: "Events")
        user.eventsCreated = events
        XCTAssertEqual(user.eventsCreated, events, "User should be able to have events")
    }
    
    func testUserCanHaveNoEventsSubscribed() {
        XCTAssert(user.eventsSubscribed.count == 0, "User should be able to have no events")
    }
    
    func testUserCanHaveEventsSubscribed() {
        var events = NSMutableArray(objects: "Events")
        user.eventsSubscribed = events
        XCTAssertEqual(user.eventsSubscribed, events, "User should be able to have events")
    }
    
    func testUserCanHaveNoEventsLiked() {
        XCTAssert(user.eventsLiked.count == 0, "User should be able to have no events")
    }
    
    func testUserCanHaveEventsLiked() {
        var events = NSMutableArray(objects: "Events")
        user.eventsLiked = events
        XCTAssertEqual(user.eventsLiked, events, "User should be able to have events")
    }
    
    func testUserCanHaveNoFriends() {
        XCTAssert(user.friends.count == 0, "User should be able to have no friends")
    }
    
    func testUserCanHaveFriends() {
        var friends = NSMutableArray(objects: "John","Alex","Sam")
        user.friends = friends
        XCTAssertEqual(user.friends, friends, "User should be able to have friends")
    }
    
    func testUserCanHaveNormalProfilePicture() {
        let normalProfilePictureUrl = "fake.url"
        user.normalProfilePicturePath = normalProfilePictureUrl
        XCTAssertEqual(user.normalProfilePicturePath!, normalProfilePictureUrl, "User should be able to have a path to their normal profile picture")
    }
    
    func testUserCanHaveThumbnailProfilePicture() {
        let thumbnailProfilePictureUrl = "fake.url"
        user.thumbnailProfilePicturePath = thumbnailProfilePictureUrl
        XCTAssertEqual(user.thumbnailProfilePicturePath!, thumbnailProfilePictureUrl, "User should be able to have a path to their thumbnail profile picture")
    }

}
