//
//  Network.swift
//  CleanArchitecture
//
//  Created by Roberto on 02/09/2019.
//  Copyright © 2019 Marcos Molero. All rights reserved.
//

import Foundation
import Alamofire

class Network {
    
    let manager: SessionManager!
    
    init() {
        self.manager = Network.configureNetworkManager()
    }
    
    private static func configureNetworkManager() -> SessionManager {
        let serverTrustPolicies: [String:ServerTrustPolicy]
        if ProcessInfo.processInfo.environment.keys.contains("EnableSecurityProtocol"){
            serverTrustPolicies = ["infrastructureandnetworknonprod.api.mashery.com": ServerTrustPolicy.performDefaultEvaluation(validateHost: true)]
        } else {
            serverTrustPolicies = ["infrastructureandnetworknonprod.api.mashery.com":.disableEvaluation]
        }
        
        // Create custom manager
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        
        let manager = Alamofire.SessionManager(
            configuration: URLSessionConfiguration.default,
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
        
        return manager
    }
}
