//
//  Event.swift
//  Dowwn
//
//  Created by Daniel on 10/8/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import Foundation


class Event {
    
    var creator:User?
    
    required init(fromUser:User) {
        self.creator = fromUser
    }
}

extension Event: Equatable {}

func == (lhs: Event, rhs: Event) -> Bool {
    return true
}