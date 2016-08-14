//
//  Player.swift
//
//  Created by Jason Larsen on 8/11/16.
//  Copyright © 2016 Jason Larsen. All rights reserved.
//

import Foundation
import Marshal

struct Player: Unmarshaling, Marshaling {
    
    var name: String
    var level: Int
    var characterClass: String
    
    init(object: MarshaledObject) throws {
        name = try object.valueForKey("name")
        level = try object.valueForKey("level")
        characterClass = try object.valueForKey("class")
    }
    
    func marshal() -> MarshalDictionary {
        return [
            "name": name,
            "level": level,
            "class": characterClass
        ]
    }
    
}
