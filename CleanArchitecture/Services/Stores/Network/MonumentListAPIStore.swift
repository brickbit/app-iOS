//
//  CustomAPIStore.swift
//  CleanArchitecture
//
//  Created by Marcos Molero on 23/6/18.
//  Copyright © 2018 Marcos Molero. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class MonumentListAPIStore: MonumentListStore {
    
    func saveMonumentListToRealmDB(monumentList: MonumentList) {
        
    }
    func getMonumentListFromRealmDB(monumentList: inout MonumentList) {
    }
    
    func getList(completion: @escaping MonumentListStoreGetListCompletionHandler) {
        try! Alamofire.request(MonumentListAPIRouter.getList.asURLRequest())
            .responseObject(completionHandler: { (response: DataResponse<MonumentListResponse>) in         
                switch response.result {
                case .success:
                    let listResponse = response.result.value
                    completion(.success(result: mapList(list: listResponse!)))
                    break
                case .failure(let error):
                    
                    completion(.failure(error: MonumentListStoreError.cannotGet("Cannot get monument \(error)")))

                    break
                }
            })
    }
}

