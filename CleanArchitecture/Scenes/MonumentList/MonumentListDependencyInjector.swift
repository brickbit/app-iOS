//
//  LandingDependencyInjector.swift
//  CleanArchitecture
//
//  Created by Marcos Molero on 23/6/18.
//  Copyright (c) 2018 Marcos Molero. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import UIKit
import Swinject

// MARK: Inject all scene dependencies

class MonumentListDependencyInjector: SwinjectViewControllerDependencyInjector<MonumentListViewController> {
    
    // MARK: Registration
    
    override class func registerDependencies(container: Container) {
        container.register(MonumentListViewController.self) { (resolver, viewController:MonumentListViewController) -> MonumentListViewController in
            let interactor = resolver.resolve(MonumentListInteractor.self)!
            let presenter = MonumentListPresenter()
            let router = MonumentListRouter()
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
