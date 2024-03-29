//
//  LandingModels.swift
//  CleanArchitecture
//
//  Created by Marcos Molero on 23/6/18.
//  Copyright (c) 2018 Marcos Molero. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates
//
//  Type "usecase" for some magic!

enum MonumentListScene {
    enum getList {
        
        struct Request {
        }
        
        struct Response {
            var listMonument: MonumentList
            var errorCode: Int?
        }
        
        struct ViewModel {
            let displayListMonumentView: ListMonumentView
            let displayError: String
            
            struct ListMonumentView {
                let list: [MonumentView]
            }
            
            struct MonumentView {
                let id: String
                let title: String
                let geocoordinates: String
            } 
        }
    }
}
