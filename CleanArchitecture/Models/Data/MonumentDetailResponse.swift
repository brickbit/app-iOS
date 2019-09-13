//
//  MonumentDetailResponse.swift
//  CleanArchitecture
//
//  Created by Roberto on 03/09/2019.
//  Copyright © 2019 Marcos Molero. All rights reserved.
//

import Foundation
import ObjectMapper

class MonumentDetailResponse: Mappable {
    var id: String = ""
    var title: String = ""
    var geocoordinates: String = ""
    var address: String = ""
    var transport: String = ""
    var email: String = ""
    var description: String = ""
    var phone: String = ""
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        geocoordinates <- map["geocoordinates"]
        address <- map["address"]
        transport <- map["transport"]
        email <- map["email"]
        description <- map["description"]
        phone <- map["phone"]
    }
}

import RealmSwift

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
