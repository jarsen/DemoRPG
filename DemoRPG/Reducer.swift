//
//  Reducer.swift
//  DemoRPG
//
//  Created by Jason Larsen on 8/14/16.
//  Copyright © 2016 Jason Larsen. All rights reserved.
//

import ReSwift

struct Reducer: ReSwift.Reducer {
    
    func handleAction(action: Action, state: State?) -> State {
        var state = state ?? State()
        state = FileWatcherReducer.handle(action: action, state: state)
        state.players = PlayerReducer.handle(action: action, state: state.players)
        state.detailState.handle(action: action)
        return state
    }
    
}

struct PlayerReducer {
    
    static func handle(action action: Action, state: [Player]) -> [Player] {
        switch action {
        case let action as LevelUp:
            var players = state
            players[action.playerIndex].level += 1
            return players
        default:
            return state
        }
    }
    
}

struct FileWatcherReducer {
    
    static func handle(action action: Action, state: State) -> State {
        switch action {
        case let action as Update<State>:
            return action.value
        default:
            return state
        }
    }
    
}
