//
//  NetworkAssembly.swift
//  CleanArchitecture
//
//  Created by Marcos Molero on 23/6/18.
//  Copyright © 2018 Marcos Molero. All rights reserved.
//

import Foundation
import Swinject

class NetworkAssembly: Assembly {
    var container:Container!
    
    func assemble(container: Container) {
        self.container = container
        registerStores()
    }
    
    func registerStores() {
        registerMonumentListStore()
        registerMonumentDetailStore()
    }
    
    private func registerMonumentListStore() {
        container.register([MonumentListStore].self) { container in
            let apiStore = container.resolve(MonumentListStore.self, name: "api")!
            let realmStore = container.resolve(MonumentListStore.self, name: "realm")!
            
            return [apiStore, realmStore]
        }
        container.register(MonumentListStore.self, name: "api") { container in
            let store = MonumentListAPIStore()
            return store
        }
        container.register(MonumentListStore.self, name: "realm") { container in
            let store = MonumentListRealmStore()
            return store
        }
    }
    
    private func registerMonumentDetailStore() {
        container.register([MonumentDetailStore].self) { container in
            let apiStore = container.resolve(MonumentDetailStore.self, name: "api")!
            let realmStore = container.resolve(MonumentDetailStore.self, name: "realm")!
            
            return [apiStore, realmStore]
        }
        container.register(MonumentDetailStore.self, name: "api") { container in
            let store = MonumentDetailAPIStore()
            return store
        }
        container.register(MonumentDetailStore.self, name: "realm") { container in
            let store = MonumentDetailRealmStore()
            return store
        }
    }
    
}
