//
//  MonumentDetailAPIStore.swift
//  CleanArchitecture
//
//  Created by Roberto on 03/09/2019.
//  Copyright © 2019 Marcos Molero. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class MonumentDetailAPIStore: MonumentDetailStore {
    
    func saveMonumentDetailToRealmDB(id: String, monumentDetail: MonumentDetail) {
    }
    
    func getMonumentDetailFromRealmDB(id: String, monumentDetail: inout MonumentDetail) {
    }
    
    func getDetails(id: String, completion: @escaping MonumentDetailStoreGetDetailsCompletionHandler) {
        try! Alamofire.request(MonumentDetailAPIRouter.getDetails(id).asURLRequest())
            .responseObject(completionHandler: { (response: DataResponse<MonumentDetailResponse>) in
                switch response.result {
                case .success:
                    let monumentResponse = response.result.value
                    completion(.success(result: mapDetail(detail: monumentResponse!)))
                    break
                case .failure(let error):
                    completion(.failure(error: MonumentDetailStoreError.cannotGet("Cannot get monument \(error)")))
                    
                    break
                }
            })
    }
}
