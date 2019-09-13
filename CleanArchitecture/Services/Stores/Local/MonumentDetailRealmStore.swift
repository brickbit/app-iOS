//
//  MonumentDetailRealmStore.swift
//  Monuments
//
//  Created by Roberto on 12/09/2019.
//  Copyright © 2019 Marcos Molero. All rights reserved.
//

import Foundation
import RealmSwift

class MonumentDetailRealmStore: MonumentDetailStore {
    
    func saveMonumentDetailToRealmDB(id: String, monumentDetail: MonumentDetail) {
        let monumentRealm = MonumentDetailRealm()
        monumentRealm.id = id
        monumentRealm.title = monumentDetail.title
        monumentRealm.geocoordinates = monumentDetail.geocoordinates
        monumentRealm.address = monumentDetail.address
        monumentRealm.transport = monumentDetail.transport
        monumentRealm.email = monumentDetail.email
        monumentRealm.descriptionDetail = monumentDetail.description
        monumentRealm.phone = monumentDetail.phone
        print("\(monumentDetail.id) \(monumentDetail.title) \(monumentDetail.phone)")
        let realm = try! Realm()
        try! realm.write {
            realm.add(monumentRealm)
        }
    }
    
    func getMonumentDetailFromRealmDB(id: String, monumentDetail: inout MonumentDetail) {
        let realm = try! Realm()
        let monumentDetailDB = realm.objects(MonumentDetailRealm.self).filter("id == %@",id).first
        if(monumentDetailDB != nil) {
            monumentDetail = getMonumentDetailDB(monumentDetailRealm: monumentDetailDB!)
        }
    }
    
    private func getMonumentDetailDB(monumentDetailRealm: MonumentDetailRealm) -> MonumentDetail {
        return MonumentDetail(
            id: monumentDetailRealm.id ?? "-1",
            title: monumentDetailRealm.title ?? "-",
            geocoordinates: monumentDetailRealm.geocoordinates ?? "0 - 0",
            address: monumentDetailRealm.address ?? "-",
            transport: monumentDetailRealm.transport ?? "-",
            email: monumentDetailRealm.email ?? "-",
            description: monumentDetailRealm.descriptionDetail ?? "-",
            phone: monumentDetailRealm.phone ?? "-")
    }
    
    
    func getDetails(id: String, completion: @escaping MonumentDetailStoreGetDetailsCompletionHandler) {
        
    }
}



