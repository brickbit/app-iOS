//
//  SceneDependencyInjector.swift
//  CleanArchitecture
//
//  Created by Marcos Molero on 23/6/18.
//  Copyright © 2018 Marcos Molero. All rights reserved.
//

import Foundation
import UIKit

class SceneDependencyInjector<T:UIViewController> : ViewControllerDependencyInjector {
    func inject(to viewController: T) {}
    typealias ViewController = T
}
