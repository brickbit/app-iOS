//
//  APIResponse.swift
//  CleanArchitecture
//
//  Created by Roberto on 02/09/2019.
//  Copyright © 2019 Marcos Molero. All rights reserved.
//

import Foundation

struct APIResponse {
    let result: String
    let errors: [APIError]
    
    init(result: String, errors: [APIError]) {
        self.result = result
        self.errors = errors
    }
}
