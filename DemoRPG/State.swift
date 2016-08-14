//
//  State.swift
//
//  Created by Jason Larsen on 8/11/16.
//  Copyright © 2016 Jason Larsen. All rights reserved.
//

import Foundation
import ReSwift
import Marshal

struct State: StateType, Unmarshaling, Marshaling {
    
    var detailState = PlayerDetailViewController.State()
    var players = [Player]()
    
    init() {}
    
    init(object: MarshaledObject) throws {
        players = try object.valueForKey("players")
        detailState = try object.valueForKey("detailState")
    }
    
    func marshal() -> MarshalDictionary {
        return [
            "detailState": detailState.marshal(),
            "players": players.map { $0.marshal() }
        ]
    }
    
}
