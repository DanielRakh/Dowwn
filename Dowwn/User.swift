//
//  User.swift
//  Dowwn
//
//  Created by Daniel on 10/8/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import Foundation

class User {
    
    let name:String
    var eventsCreated = NSMutableArray()
    var eventsSubscribed = NSMutableArray()
    var eventsLiked = NSMutableArray()
    var friends = NSMutableArray()
    var normalProfilePicturePath:String?
    var thumbnailProfilePicturePath:String?
    
    required init(name: String) {
        self.name = name
    }
    
}
