//
//  DesktopDaemon.swift
//  DemoRPG
//
//  Created by Jason Larsen on 8/14/16.
//  Copyright © 2016 Jason Larsen. All rights reserved.
//

import Foundation
import Marshal
import ReSwift
import KZFileWatchers

class DesktopDaemon: StoreSubscriber {
    
    private var stateJSONPath: String
    private var fileWatcher: FileWatcherProtocol
    
    init(path: String) {
        stateJSONPath = path
        #if (arch(i386) || arch(x86_64)) && os(iOS)
            fileWatcher = FileWatcher.Local(path: stateJSONPath)
            
            try! fileWatcher.start({ result in
                switch result {
                case .noChanges:
                    break
                case .updated(let data):
                    do {
                        let json = try JSONParser.JSONObjectWithData(data)
                        let state = try State(object: json)
                        App.store.dispatch(Update(value: state))
                    }
                    catch {
                        print(error)
                    }
                }
            })
            
            App.store.subscribe(self)
            
        #endif
    }
    
    func newState(state: State) {
        do {
            let stateJSON = state.marshal()
            let stateData = try NSJSONSerialization.dataWithJSONObject(stateJSON, options: .PrettyPrinted)
            try stateData.writeToFile(stateJSONPath, options: [])
        }
        catch {
            print(error)
        }
    }
    
}

