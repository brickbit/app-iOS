//
//  MonumentDetailAPIRouter.swift
//  CleanArchitecture
//
//  Created by Roberto on 03/09/2019.
//  Copyright © 2019 Marcos Molero. All rights reserved.
//

import Foundation
import Alamofire

enum MonumentDetailAPIRouter: URLRequestConvertible {
    
    case getDetails(String)
    
    func asURLRequest() throws -> URLRequest {
        var url: URL!
        var request: URLRequest!
        
        switch self {
        case .getDetails(let id):
            let urlId = "\(Constants.API.Monuments.Points.url)/\(id)"
            url = URL(string: urlId)
            request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            return try JSONEncoding().encode(request)
        }
    }
}

