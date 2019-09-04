//
//  BusinessAssembly.swift
//  CleanArchitecture
//
//  Created by Marcos Molero on 23/6/18.
//  Copyright © 2018 Marcos Molero. All rights reserved.
//

import Foundation
import Swinject

class BusinessAssembly: Assembly {
    var container:Container!
    
    func assemble(container: Container) {
        self.container = container
        registerWorkers()
        registerInteractors()
    }
    // ============================ INTERACTORS ============================
    private func registerInteractors() {
        registerListInteractor()
        registerDetailInteractor()
    }
    
    private func registerListInteractor() {
        container.register(MonumentListInteractor.self) { container in
            let monumentListStoreWorker = container.resolve(MonumentListStoreWorker.self)!
            let interactor = MonumentListInteractor()
            interactor.monumentListStoreWorker = monumentListStoreWorker
            
            return interactor
        }
    }
    
    private func registerDetailInteractor() {
        container.register(MonumentDetailInteractor.self) { container in
            let monumentDetailStoreWorker = container.resolve(MonumentDetailStoreWorker.self)!
            let interactor = MonumentDetailInteractor()
            interactor.monumentDetailStoreWorker = monumentDetailStoreWorker
            
            return interactor
        }
    }
    
    // ============================ WORKERS ============================
    private func registerWorkers() {
        registerMonumentListStoreWorker()
        registerMonumentDetailStoreWorker()
    }
    
    private func registerMonumentListStoreWorker() {
        container.register(MonumentListStoreWorker.self) { container in
            let store = container.resolve(MonumentListStore.self)!
            let monumentListStoreWorker = MonumentListStoreWorker(store: store)

            return monumentListStoreWorker
        }
    }
    
    private func registerMonumentDetailStoreWorker() {
        container.register(MonumentDetailStoreWorker.self) { container in
            let store = container.resolve(MonumentDetailStore.self)!
            let monumentListStoreWorker = MonumentDetailStoreWorker(store: store)
            
            return monumentListStoreWorker
        }
    }
}
