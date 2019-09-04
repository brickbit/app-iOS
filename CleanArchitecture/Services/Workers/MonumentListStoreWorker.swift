//
//  CustomStoreWorker.swift
//  CleanArchitecture
//
//  Created by Marcos Molero on 23/6/18.
//  Copyright © 2018 Marcos Molero. All rights reserved.
//

class MonumentListStoreWorker {
    
    // MARK: Business Logic
    let MonumentListStore: MonumentListStore!
    
    init(store: MonumentListStore) {
        self.MonumentListStore = store
    }
    
    func getList(completion: @escaping MonumentListStoreGetListCompletionHandler) {
        MonumentListStore.getList(completion: completion)

    }
}

