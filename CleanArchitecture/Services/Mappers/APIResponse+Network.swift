//
//  Custom+Network.swift
//  CleanArchitecture
//
//  Created by Marcos Molero on 23/6/18.
//  Copyright © 2018 Marcos Molero. All rights reserved.
//
/*
import Foundation
import SwiftyJSON

extension APIResponse: ResponseObjectSerializable {
    init?(fromJSON json: JSON) {
        self.result = json["result"].stringValue
        print("APIResponse: ResponseObjectSerializable")
        print(result)
        print("APIResponse: ResponseObjectSerializable")
        var errors:[APIError] = []
        for item in json["errors"].arrayValue {
            let error = APIError(fromJSON: item)!
            errors.append(error)
        }
        
        self.errors = errors
    }
}

*/
