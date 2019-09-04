//
//  Constants.swift
//  CleanArchitecture
//
//  Created by Marcos Molero on 23/6/18.
//  Copyright © 2018 Marcos Molero. All rights reserved.
//

import Foundation

struct Constants {
    
    struct API {
        static let BASE_URL: String = "https://t21services.herokuapp.com"

        struct Monuments {
            struct Points {
                static let url = Constants.API.BASE_URL + "/points"
            }
        }
    }
}
