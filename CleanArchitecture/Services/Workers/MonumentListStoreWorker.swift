//
//  CustomStoreWorker.swift
//  CleanArchitecture
//
//  Created by Marcos Molero on 23/6/18.
//  Copyright © 2018 Marcos Molero. All rights reserved.
//

class MonumentListStoreWorker {
    
    // MARK: Business Logic
    let monumentListStore: [MonumentListStore]!
    
    init(store: [MonumentListStore]) {
        self.monumentListStore = store
    }
    
    func getList(completion: @escaping MonumentListStoreGetListCompletionHandler) {
        monumentListStore[0].getList(completion: completion)
    }
    func saveMonumentListToRealmDB(monumentList: MonumentList, completion: @escaping MonumentListStoreSaveListCompletionHandler) {
        monumentListStore[1].saveMonumentListToRealmDB(monumentList: monumentList, completion: completion)
    }
}

