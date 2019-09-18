//
//  MonumentListResponseRealm.swift
//  Monuments
//
//  Created by Roberto on 18/09/2019.
//  Copyright © 2019 Marcos Molero. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class MonumentListRealm: Object {
    let list = List<MonumentRealm>()
}

class MonumentRealm: Object, Mappable {
    @objc dynamic var id: String?
    @objc dynamic var title: String?
    @objc dynamic var geocoordinates: String?
    
    required convenience init?(map: Map) { self.init() }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        geocoordinates <- map["geocoordinates"]
    }
}
