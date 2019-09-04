//
//  LandingInteractor.swift
//  CleanArchitecture
//
//  Created by Marcos Molero on 23/6/18.
//  Copyright (c) 2018 Marcos Molero. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

protocol MonumentListBusinessLogic {
    func getList(request: MonumentListScene.getList.Request)

}

protocol MonumentListDataStore {
    
}

class MonumentListInteractor: MonumentListBusinessLogic, MonumentListDataStore {
    
    var presenter: MonumentListPresentationLogic?
    var monumentListStoreWorker: MonumentListStoreWorker!
    
    // MARK: Business logic
    func getList(request: MonumentListScene.getList.Request) {
        monumentListStoreWorker.getList() { (result) in
            switch result {
            case .success(let monumentList):
                let response = MonumentListScene.getList.Response(listMonument: monumentList, errorCode: 1)
                self.presenter?.presentGetListSuccess(response: response)
                break
            case .failure(let error):
                debugPrint(error.localizedDescription)
                let response = MonumentListScene.getList.Response(listMonument: MonumentList(list: []), errorCode: 1)
                self.presenter?.presentGetListError(response: response)
                break
            }
        }
    }

}
