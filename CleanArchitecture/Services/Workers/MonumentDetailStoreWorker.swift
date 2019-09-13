//
//  MonumentDetailWorker.swift
//  CleanArchitecture
//
//  Created by Roberto on 03/09/2019.
//  Copyright © 2019 Marcos Molero. All rights reserved.
//

class MonumentDetailStoreWorker {
    
    // MARK: Business Logic
    let monumentDetailStore: [MonumentDetailStore]!
    
    init(store: [MonumentDetailStore]) {
        self.monumentDetailStore = store
    }
    
    func getDetails(with id: String, completion: @escaping MonumentDetailStoreGetDetailsCompletionHandler) {
        monumentDetailStore[0].getDetails(id: id, completion: completion)
    }
    
    func saveMonumentDetailToRealmDB(with id: String, monumentDetail: MonumentDetail, completion: @escaping MonumentDetailStoreSaveDetailCompletionHandler) {
        monumentDetailStore[1].saveMonumentDetailToRealmDB(id: id, monumentDetail: monumentDetail)
    }
    
    func getMonumentDetailFromRealmDB(with id: String, monumentDetail: inout MonumentDetail){
        monumentDetailStore[1].getMonumentDetailFromRealmDB(id: id, monumentDetail: &monumentDetail)
    }
}
