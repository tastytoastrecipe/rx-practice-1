//
//  MainReactor.swift
//  rx-practice-1
//
//  Created by orca on 2022/08/24.
//

import Foundation
import ReactorKit
import RxSwift

class MainReactor: Reactor {
    enum Action {
        case tapItem(UITabBarItem)
    }
    
    enum Mutation {
        case gotoTableVc
        case gotoCellctionVc
        case gotoStackVc
        case gotoScrollVc
        case none
    }
    
    struct State {
        var currentScene = Scenes.main
    }
    
    var initialState = State()
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .tapItem(let item):
            if item.tag == Scenes.table.rawValue {
                print("\nMainReactor::mutate\n - go to TableVc\n\n")
                return Observable.just(Mutation.gotoTableVc)
            }
        }
        
        return Observable.just(Mutation.none)
        
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case .gotoTableVc:
            state.currentScene = Scenes.table
            return state
        case .gotoCellctionVc:
            return state
        case .gotoStackVc:
            return state
        case .gotoScrollVc:
            return state
        case .none:
            return state
        }
    }
    
}
