//
//  MonumentListResponse.swift
//  CleanArchitecture
//
//  Created by Roberto on 03/09/2019.
//  Copyright © 2019 Marcos Molero. All rights reserved.
//

import Foundation
import ObjectMapper

class MonumentListResponse: Mappable {
    var list: [MonumentResponse] = []
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        list <- map["list"]
    }
}

class MonumentResponse: Mappable {
    var id: String = ""
    var title: String = ""
    var geocoordinates: String = ""
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        geocoordinates <- map["geocoordinates"]
    }
}

import RealmSwift

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
