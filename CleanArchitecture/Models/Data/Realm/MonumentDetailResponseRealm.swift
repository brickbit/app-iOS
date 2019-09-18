//
//  MonumentDetailResponseRealm.swift
//  Monuments
//
//  Created by Roberto on 18/09/2019.
//  Copyright © 2019 Marcos Molero. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class MonumentDetailRealm: Object, Mappable {
    @objc dynamic var id: String?
    @objc dynamic var title: String?
    @objc dynamic var geocoordinates: String?
    @objc dynamic var address: String?
    @objc dynamic var transport: String?
    @objc dynamic var email: String?
    @objc dynamic var descriptionDetail: String?
    @objc dynamic var phone: String?
    
    required convenience init?(map: Map) { self.init() }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        geocoordinates <- map["geocoordinates"]
        address <- map["address"]
        transport <- map["transport"]
        email <- map["email"]
        descriptionDetail <- map["descriptionDetail"]
        phone <- map["phone"]
    }
}
