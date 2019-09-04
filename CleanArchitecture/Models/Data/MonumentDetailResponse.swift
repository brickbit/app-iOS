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
