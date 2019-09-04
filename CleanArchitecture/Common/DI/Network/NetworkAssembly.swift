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
        container.register(MonumentListStore.self) { container in
            let registerAPIStore = MonumentListAPIStore()
            return registerAPIStore
        }
    }
    
    private func registerMonumentDetailStore() {
        container.register(MonumentDetailStore.self) { container in
            let registerAPIStore = MonumentDetailAPIStore()
            return registerAPIStore
        }
    }
    
}
