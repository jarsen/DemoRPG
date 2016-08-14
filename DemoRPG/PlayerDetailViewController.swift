//
//  PlayerDetailViewController.swift
//  DemoRPG
//
//  Created by Jason Larsen on 8/14/16.
//  Copyright © 2016 Jason Larsen. All rights reserved.
//

import UIKit
import ReSwift
import Marshal

extension PlayerDetailViewController {
    
    struct State: Marshaling, Unmarshaling  {
        var selectedIndex: Int?
        
        init() {}
        
        init(object: MarshaledObject) throws {
            selectedIndex = try object.valueForKey("selectedIndex")
        }
        
        mutating func handle(action action: Action) {
            switch action {
            case let action as ShowPlayer:
                selectedIndex = action.playerIndex
            default:
                break
            }
        }
        
        func marshal() -> MarshalDictionary {
            var json = MarshalDictionary()
            json["selectedIndex"] = selectedIndex
            return json
        }
        
    }
    
}

class PlayerDetailViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel?
    @IBOutlet var levelLabel: UILabel?
    @IBOutlet var classLabel: UILabel?
    
    var store = App.store
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        store.subscribe(self)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        store.unsubscribe(self)
    }
    
    @IBAction func didPressLevelUp() {
        guard let playerIndex = store.state.detailState.selectedIndex else { return }
        store.dispatch(LevelUp(playerIndex: playerIndex))
    }
    
}

extension PlayerDetailViewController: StoreSubscriber {
    
    func newState(state: DemoRPG.State) {
        guard let selectedIndex = state.detailState.selectedIndex else { return }
        let player = state.players[selectedIndex]
        title = player.name
        nameLabel?.text = player.name
        levelLabel?.text = "Lvl \(player.level)"
        classLabel?.text = player.characterClass
    }
    
}


