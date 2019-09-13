//
//  MonumentDetailInteractor.swift
//  CleanArchitecture
//
//  Created by Roberto on 03/09/2019.
//  Copyright © 2019 Marcos Molero. All rights reserved.
//


protocol MonumentDetailBusinessLogic {
    func getDetail(id: String, request: MonumentDetailScene.getDetail.Request) -> Bool
}

protocol MonumentDetailDataStore {
    
}

class MonumentDetailInteractor: MonumentDetailBusinessLogic, MonumentDetailDataStore {
    
    var presenter: MonumentDetailPresentationLogic?
    var monumentDetailStoreWorker: MonumentDetailStoreWorker!
    var strategy = SourceStrategy.LOCAL

    var id = ""
    
    // MARK: Business logic
    func getDetail(id: String, request: MonumentDetailScene.getDetail.Request) -> Bool {
        var obtained = false
        switch strategy {
        case SourceStrategy.NETWORK_SAVE_LOCAL:
            obtained = getDetailAndSave(id: id)
            break
        case SourceStrategy.LOCAL:
            obtained = getDetailFromDB(id: id)
        default:
            obtained = getDetailFromNetwork(id: id)
        }
        return obtained
    }
    
    func getDetailAndSave(id: String) -> Bool {
        var obtained = false
        monumentDetailStoreWorker.getDetails(with: id) { (result) in
            switch result {
            case .success(let monumentDetail):
                obtained = true
                let response = MonumentDetailScene.getDetail.Response(detailMonument: monumentDetail, errorCode: 1)
                self.presenter?.presentGetDetailSuccess(response: response)
                self.monumentDetailStoreWorker.saveMonumentDetailToRealmDB(with: id, monumentDetail: monumentDetail, completion: { (resultDB) in
                    switch resultDB {
                    case .success:
                        print("El guardado en la base de datos se ha realizado con éxito")
                        self.strategy = SourceStrategy.LOCAL
                        break
                    case .failure(let error):
                        debugPrint(error.localizedDescription)
                        break
                    }
                })
                break
            case .failure(let error):
                debugPrint(error.localizedDescription)
                let response = MonumentDetailScene.getDetail.Response(detailMonument: MonumentDetail(id: "-1", title: "", geocoordinates: "", address: "", transport: "", email: "", description: "", phone: ""), errorCode: 1)
                self.presenter?.presentGetDetailError(response: response)
                break
            }
        }
        return obtained
    }
    
    func getDetailFromNetwork(id: String) -> Bool {
        var obtained = false
        monumentDetailStoreWorker.getDetails(with: id) { (result) in
            switch result {
            case .success(let monumentDetail):
                let response = MonumentDetailScene.getDetail.Response(detailMonument: monumentDetail, errorCode: 1)
                self.presenter?.presentGetDetailSuccess(response: response)
                obtained = true
                break
            case .failure(let error):
                debugPrint(error.localizedDescription)
                let response = MonumentDetailScene.getDetail.Response(detailMonument: MonumentDetail(id: "-1", title: "-", geocoordinates: "0-0", address: "-", transport: "-", email: "-", description: "-", phone: "-"), errorCode: 1)
                self.presenter?.presentGetDetailError(response: response)
                break
            }
        }
        return obtained
    }
    
    func getDetailFromDB(id: String) -> Bool {
        var obtained = false
        var monumentDetail = MonumentDetail(id: "-1", title: "-", geocoordinates: "0-0", address: "-", transport: "-", email: "-", description: "-", phone: "-")
        monumentDetailStoreWorker.getMonumentDetailFromRealmDB(with: id, monumentDetail: &monumentDetail)
        if monumentDetail.id != "-1" {
            let response = MonumentDetailScene.getDetail.Response(detailMonument: monumentDetail, errorCode: 1)
            self.presenter?.presentGetDetailSuccess(response: response)
            obtained = true
        }
        else {
            strategy = SourceStrategy.NETWORK_SAVE_LOCAL
        }
        
        return obtained
    }

}

