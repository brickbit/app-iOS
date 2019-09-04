//
//  MonumentDetailDependencyInjector.swift
//  CleanArchitecture
//
//  Created by Roberto on 03/09/2019.
//  Copyright © 2019 Marcos Molero. All rights reserved.
//

import UIKit
import Swinject

// MARK: Inject all scene dependencies

class MonumentDetailDependencyInjector: SwinjectViewControllerDependencyInjector<MonumentDetailViewController> {
    
    // MARK: Registration
    
    override class func registerDependencies(container: Container) {
        container.register(MonumentDetailViewController.self) { (resolver, viewController:MonumentDetailViewController) -> MonumentDetailViewController in
            let interactor = resolver.resolve(MonumentDetailInteractor.self)!
            let presenter = MonumentDetailPresenter()
            let router = MonumentDetailRouter()
            viewController.interactor = interactor
            viewController.router = router
            interactor.presenter = presenter
            presenter.viewController = viewController
            router.viewController = viewController
            router.dataStore = interactor
            return viewController
        }
    }
}
