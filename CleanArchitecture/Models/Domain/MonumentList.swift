//
//  Custom.swift
//  CleanArchitecture
//
//  Created by Marcos Molero on 23/6/18.
//  Copyright © 2018 Marcos Molero. All rights reserved.
//

import Foundation

class MonumentList {
    let list: [Monument]
    
    init(list: [Monument]) {
        self.list = list
    }
}

class Monument {
    let id: String
    let title: String
    let geocoordinates: String
    
    init(id: String, title: String, geocoordinates: String) {
        self.id = id
        self.title = title
        self.geocoordinates = geocoordinates
    }
}
