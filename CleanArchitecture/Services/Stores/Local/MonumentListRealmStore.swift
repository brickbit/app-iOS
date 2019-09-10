//
//  CustomLocalStore.swift
//  CleanArchitecture
//
//  Created by Marcos Molero on 23/6/18.
//  Copyright © 2018 Marcos Molero. All rights reserved.
//

import Foundation
import RealmSwift

class MonumentListRealmStore: MonumentListStore {
    func saveMonumentListToRealmDB(monumentList: MonumentList, completion: @escaping MonumentListStoreSaveListCompletionHandler) {
        let monumentListRealm = MonumentListRealm()
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(monumentListRealm, update: false)
        }
        
        debugPrint(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    func getList(completion: @escaping MonumentListStoreGetListCompletionHandler) {
        
    }
    
}
