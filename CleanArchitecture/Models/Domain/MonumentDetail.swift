//
//  MonumentDetail.swift
//  CleanArchitecture
//
//  Created by Roberto on 03/09/2019.
//  Copyright © 2019 Marcos Molero. All rights reserved.
//

import Foundation

class MonumentDetail {
    let id: String
    let title: String
    let geocoordinates: String
    let address: String
    let transport: String
    let email: String
    let description: String
    let phone: String
    
    init(id: String, title: String, geocoordinates: String, address: String, transport: String, email: String, description: String, phone: String) {
        self.id = id
        self.title = title
        self.geocoordinates = geocoordinates
        self.address = address
        self.transport = transport
        self.email = email
        self.description = description
        self.phone = phone
    }
}
