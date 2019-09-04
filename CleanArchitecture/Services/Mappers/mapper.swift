//
//  mapper.swift
//  CleanArchitecture
//
//  Created by Roberto on 02/09/2019.
//  Copyright © 2019 Marcos Molero. All rights reserved.
//

import Foundation

/* MonumentList*/
//Response -> Domain
func mapList(list: MonumentListResponse) -> MonumentList{
    return MonumentList(list: list.list.map({ (monument) -> Monument in
        return mapMonument(monument: monument)
    }))
}
func mapMonument(monument: MonumentResponse) -> Monument{
    return(Monument(id: monument.id, title: monument.title, geocoordinates: monument.geocoordinates))
}

//Domain -> View
func mapListView(list: MonumentList) -> MonumentListScene.getList.ViewModel.ListMonumentView{
    return(MonumentListScene.getList.ViewModel.ListMonumentView(list: list.list.map({ (monument) -> MonumentListScene.getList.ViewModel.MonumentView in
        return mapMonumentView(monument: monument)
    })))
}//[List]->[ListView]

func mapMonumentView(monument: Monument) -> MonumentListScene.getList.ViewModel.MonumentView{
    return(MonumentListScene.getList.ViewModel.MonumentView(id: monument.id, title: monument.title, geocoordinates: monument.geocoordinates))
}//[Monument]->[MonumentView]


/*MonumentDetail*/
//Response -> Domain
func mapDetail(detail: MonumentDetailResponse) -> MonumentDetail{
    return MonumentDetail(id: detail.id, title: detail.title, geocoordinates: detail.geocoordinates, address: detail.address, transport: detail.transport, email: detail.email, description: detail.description, phone: detail.phone)
}

//Domain -> View
func mapDetailView(detail: MonumentDetail) -> MonumentDetailScene.getDetail.ViewModel.DetailMonumentView{
    return(MonumentDetailScene.getDetail.ViewModel.DetailMonumentView(id: detail.id, title: detail.title, geocoordinates: detail.geocoordinates, address: detail.address, transport: detail.transport, email: detail.email, description: detail.description, phone: detail.phone))
}
