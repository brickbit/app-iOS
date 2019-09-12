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
    func saveMonumentListToRealmDB(monumentList: MonumentList) {
        if try! Realm().objects(MonumentRealm.self).count == 0 {
            let list = MonumentListRealm()
            monumentList.list.map({(item) -> Void in list.list.append(saveMonumentDB(monument: item)) })
        }
    }

    private func saveMonumentDB(monument: Monument) -> MonumentRealm {
        let monumentRealm = MonumentRealm()
        monumentRealm.id = monument.id
        monumentRealm.title = monument.title
        monumentRealm.geocoordinates = monument.geocoordinates
        let realm = try! Realm()
         try! realm.write {
         realm.add(monumentRealm)
         }
        return monumentRealm
    }
    
    func getMonumentListFromRealmDB(monumentList: inout MonumentList) {
        let realm = try! Realm()
        let monumentListDB = realm.objects(MonumentRealm.self)
        var listDB: [MonumentRealm] = []
        for i in 0 ..< monumentListDB.count {
            listDB.append(monumentListDB[i])
        }
        var list: [Monument] = []
        listDB.map({(item) -> Void in
            list.append(self.getMonumentDB(monumentRealm: item))
        })
        monumentList = MonumentList(list: list)
    }
    
    private func getMonumentDB(monumentRealm: MonumentRealm) -> Monument {
        return Monument(id: monumentRealm.id ?? "-1", title: monumentRealm.title ?? "-", geocoordinates: monumentRealm.geocoordinates ?? "0 - 0")
    }
    
    
    func getList(completion: @escaping MonumentListStoreGetListCompletionHandler) {
        
    }
}


