//
//  MonumentDetailInteractor.swift
//  CleanArchitecture
//
//  Created by Roberto on 03/09/2019.
//  Copyright © 2019 Marcos Molero. All rights reserved.
//


protocol MonumentDetailBusinessLogic {
    func getDetail(id: String, request: MonumentDetailScene.getDetail.Request)
}

protocol MonumentDetailDataStore {
    
}

class MonumentDetailInteractor: MonumentDetailBusinessLogic, MonumentDetailDataStore {

    var presenter: MonumentDetailPresentationLogic?
    var monumentDetailStoreWorker: MonumentDetailStoreWorker!
    
    var id = ""//FIXME
    
    // MARK: Business logic
    func getDetail(id: String, request: MonumentDetailScene.getDetail.Request) {
        monumentDetailStoreWorker.getDetails(with: id) { (result) in
            switch result {
            case .success(let monumentDetail):
                let response = MonumentDetailScene.getDetail.Response(detailMonument: monumentDetail, errorCode: 1)
                print("En el interactor....")
                print(response.detailMonument.title)
                print(response.detailMonument.phone)
                self.presenter?.presentGetDetailSuccess(response: response)
                break
            case .failure(let error):
                debugPrint(error.localizedDescription)
                let response = MonumentDetailScene.getDetail.Response(detailMonument: MonumentDetail(id: "-1", title: "", geocoordinates: "", address: "", transport: "", email: "", description: "", phone: ""), errorCode: 1)
                self.presenter?.presentGetDetailError(response: response)
                break
            }
        }
    }
}

