//
//  MonumentDetailWorker.swift
//  CleanArchitecture
//
//  Created by Roberto on 03/09/2019.
//  Copyright © 2019 Marcos Molero. All rights reserved.
//

class MonumentDetailStoreWorker {
    
    // MARK: Business Logic
    let MonumentDetailStore: MonumentDetailStore!
    
    init(store: MonumentDetailStore) {
        self.MonumentDetailStore = store
    }
    
    func getDetails(with id: String, completion: @escaping MonumentDetailStoreGetDetailsCompletionHandler) {
        MonumentDetailStore.getDetails(id: id, completion: completion)
        
    }
}
