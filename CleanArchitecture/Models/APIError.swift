//
//  APIError.swift
//  CleanArchitecture
//
//  Created by Roberto on 02/09/2019.
//  Copyright © 2019 Marcos Molero. All rights reserved.
//

import Foundation

struct APIError {
    let code: Int
    let description: String
    
    init(code: Int, description: String) {
        self.code = code
        self.description = description
    }
}
