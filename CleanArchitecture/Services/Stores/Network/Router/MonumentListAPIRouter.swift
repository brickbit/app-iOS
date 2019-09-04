//
//  CustomAPIRouter.swift
//  CleanArchitecture
//
//  Created by Marcos Molero on 23/6/18.
//  Copyright © 2018 Marcos Molero. All rights reserved.
//

import Foundation
import Alamofire

enum MonumentListAPIRouter: URLRequestConvertible {
    
    case getList
    
    func asURLRequest() throws -> URLRequest {
        var url: URL!
        var request: URLRequest!
        
        switch self {
            case .getList:
                url = URL(string: Constants.API.Monuments.Points.url)
                request = URLRequest(url: url)
                request.httpMethod = "GET"
                
            return try JSONEncoding().encode(request)
        }
    }
}

