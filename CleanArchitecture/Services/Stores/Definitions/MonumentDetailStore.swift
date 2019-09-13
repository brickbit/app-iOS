//
//  MonumentDetailStore.swift
//  CleanArchitecture
//
//  Created by Roberto on 03/09/2019.
//  Copyright © 2019 Marcos Molero. All rights reserved.
//

import Foundation

protocol MonumentDetailStore {
    func getDetails(id: String, completion: @escaping MonumentDetailStoreGetDetailsCompletionHandler)
    func saveMonumentDetailToRealmDB(id: String, monumentDetail: MonumentDetail)
    func getMonumentDetailFromRealmDB(id: String, monumentDetail: inout MonumentDetail)
}

typealias MonumentDetailStoreGetDetailsCompletionHandler = (MonumentDetailStoreResult<MonumentDetail>) -> Void
typealias MonumentDetailStoreSaveDetailCompletionHandler = (MonumentDetailStoreEmptyResult) -> Void


enum MonumentDetailStoreResult<U> {
    case success(result: U)
    case failure(error: MonumentDetailStoreError)
}

enum MonumentDetailStoreEmptyResult {
    case success
    case failure(error: MonumentDetailStoreError)
}

enum MonumentDetailStoreError: Equatable, Error {
    case cannotGet(String)
    case cannotCreate(String)
    case cannotUpdate(String)
    case cannotDelete(String)
}

func ==(lhs: MonumentDetailStoreError, rhs: MonumentDetailStoreError) -> Bool {
    switch (lhs, rhs) {
    case (.cannotGet(let a), .cannotGet(let b)) where a == b: return true
    case (.cannotCreate(let a), .cannotCreate(let b)) where a == b: return true
    case (.cannotUpdate(let a), .cannotUpdate(let b)) where a == b: return true
    case (.cannotDelete(let a), .cannotDelete(let b)) where a == b: return true
    default:
        return false
    }
}

