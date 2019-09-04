//
//  MonumentDetailPresenter.swift
//  CleanArchitecture
//
//  Created by Roberto on 03/09/2019.
//  Copyright © 2019 Marcos Molero. All rights reserved.
//

protocol MonumentDetailPresentationLogic {
    func presentGetDetailSuccess(response: MonumentDetailScene.getDetail.Response)
    func presentGetDetailError(response: MonumentDetailScene.getDetail.Response) 
}

class MonumentDetailPresenter: MonumentDetailPresentationLogic {
    
    weak var viewController: MonumentDetailDisplayLogic?
    
    // MARK: Presentation logic
    func presentGetDetailSuccess(response: MonumentDetailScene.getDetail.Response) {
        let viewModel = MonumentDetailScene.getDetail.ViewModel(displayDetailMonumentView: mapDetailView(detail: response.detailMonument), displayError: "")
        print("En el presenter...")
        print(viewModel.displayDetailMonumentView.title)
        print(viewModel.displayDetailMonumentView.address)
        viewController?.displayGetDetailSuccess(viewModel: viewModel)
    }
    
    func presentGetDetailError(response: MonumentDetailScene.getDetail.Response) {
        let viewModel = mapMonumentDetailErrorToViewModelError(response: response)
        viewController?.displayGetDetailError(viewModel: viewModel)
    }
    
    func mapMonumentDetailErrorToViewModelError(response: MonumentDetailScene.getDetail.Response) -> MonumentDetailScene.getDetail.ViewModel {
        return MonumentDetailScene.getDetail.ViewModel(displayDetailMonumentView: mapDetailView(detail: response.detailMonument), displayError: "")
    }

}

