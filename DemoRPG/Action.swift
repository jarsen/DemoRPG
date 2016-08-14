//
//  Action.swift
//  DemoRPG
//
//  Created by Jason Larsen on 8/14/16.
//  Copyright © 2016 Jason Larsen. All rights reserved.
//

import ReSwift

struct LevelUp: Action {
    var playerIndex: Int
}

struct ShowPlayer: Action {
    var playerIndex: Int
}

struct Update<T>: Action {
    var value: T
}