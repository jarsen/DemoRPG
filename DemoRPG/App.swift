//
//  App.swift
//  DemoRPG
//
//  Created by Jason Larsen on 8/14/16.
//  Copyright © 2016 Jason Larsen. All rights reserved.
//

import Foundation
import ReSwift

struct App {
    
    static let store = Store<State>(reducer: Reducer(), state: State())
    
}
