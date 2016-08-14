//
//  PlayerListViewController.swift
//  ReSwiftRPG
//
//  Created by Jason Larsen on 8/11/16.
//  Copyright © 2016 Jason Larsen. All rights reserved.
//

import UIKit
import ReSwift

typealias IndexPath = NSIndexPath

class PlayerListViewController: UITableViewController {
    
    var store = App.store
    var players = [Player]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        store.subscribe(self) { state in state.players }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillAppear(animated)
        store.unsubscribe(self)
    }
    
    func player(at indexPath: IndexPath) -> Player {
        return players[indexPath.row]
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PlayerCell", forIndexPath: indexPath)
        
        let player = self.player(at: indexPath)
        cell.textLabel?.text = player.name
        cell.detailTextLabel?.text = "Lvl \(player.level)"
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        store.dispatch(ShowPlayer(playerIndex: indexPath.row))
    }
    
}

extension PlayerListViewController: StoreSubscriber {
    
    func newState(state: [Player]) {
        players = state
    }
    
}


