//
//  MonumentListModels.swift
//  CleanArchitecture
//
//  Created by Roberto on 03/09/2019.
//  Copyright © 2019 Marcos Molero. All rights reserved.
//

import Foundation

enum MonumentDetailScene {
    enum getDetail {
        
        struct Request {
            var id: String
        }
        
        struct Response {
            var detailMonument: MonumentDetail
            var errorCode: Int?
        }
        
        struct ViewModel {
            let displayDetailMonumentView: DetailMonumentView
            let displayError: String
            
            struct DetailMonumentView {
                let id: String
                let title: String
                let geocoordinates: String
                let address: String
                let transport: String
                let email: String
                let description: String
                let phone: String
            }
        }
    }
}
