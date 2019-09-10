//
//  CustomStore.swift
//  CleanArchitecture
//
//  Created by Marcos Molero on 23/6/18.
//  Copyright © 2018 Marcos Molero. All rights reserved.
//

import Foundation

protocol MonumentListStore {
    func getList(completion: @escaping MonumentListStoreGetListCompletionHandler)
    func saveMonumentListToRealmDB(monumentList: MonumentList, completion: @escaping MonumentListStoreSaveListCompletionHandler)
}

typealias MonumentListStoreGetListCompletionHandler = (MonumentListStoreResult<MonumentList>) -> Void
typealias MonumentListStoreSaveListCompletionHandler = (MonumentListStoreEmptyResult) -> Void

enum MonumentListStoreResult<U> {
    case success(result: U)
    case failure(error: MonumentListStoreError)
}

enum MonumentListStoreEmptyResult {
    case success
    case failure(error: MonumentListStoreError)
}

enum MonumentListStoreError: Equatable, Error {
    case cannotGet(String)
    case cannotCreate(String)
    case cannotUpdate(String)
    case cannotDelete(String)
}

func ==(lhs: MonumentListStoreError, rhs: MonumentListStoreError) -> Bool {
    switch (lhs, rhs) {
    case (.cannotGet(let a), .cannotGet(let b)) where a == b: return true
    case (.cannotCreate(let a), .cannotCreate(let b)) where a == b: return true
    case (.cannotUpdate(let a), .cannotUpdate(let b)) where a == b: return true
    case (.cannotDelete(let a), .cannotDelete(let b)) where a == b: return true
    default:
        return false
    }
}
