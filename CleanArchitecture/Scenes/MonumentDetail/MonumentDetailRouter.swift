//
//  MonumentDetailRouter.swift
//  CleanArchitecture
//
//  Created by Roberto on 03/09/2019.
//  Copyright © 2019 Marcos Molero. All rights reserved.
//

import UIKit

protocol MonumentDetailRoutingLogic {
}

protocol MonumentDetailDataPassing {
    func passDataToNextScene(for segue:UIStoryboardSegue)
    var dataStore: MonumentDetailDataStore? { get }
}

class MonumentDetailRouter: MonumentDetailRoutingLogic, MonumentDetailDataPassing {
    
    weak var viewController: MonumentDetailViewController?
    var dataStore: MonumentDetailDataStore?
    
    
    // MARK: Navigation
    
    
    // MARK: Communication
    
    func passDataToNextScene(for segue: UIStoryboardSegue) {
        // NOTE: Teach the router which scenes it can communicate with
    
    }
}
