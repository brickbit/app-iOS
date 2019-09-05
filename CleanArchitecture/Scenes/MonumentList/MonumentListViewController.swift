//
//  LandingViewController.swift
//  CleanArchitecture
//
//  Created by Marcos Molero on 23/6/18.
//  Copyright (c) 2018 Marcos Molero. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import UIKit

protocol MonumentListDisplayLogic: class {
    func displayGetListSuccess(viewModel: MonumentListScene.getList.ViewModel)
    func displayGetListError(viewModel: MonumentListScene.getList.ViewModel)
}

class MonumentListViewController: UITableViewController, MonumentListDisplayLogic {
    
    var interactor: MonumentListBusinessLogic?
    var router: (MonumentListRoutingLogic & MonumentListDataPassing)?
    var dependencyInjector:SceneDependencyInjector! = MonumentListDependencyInjector()
    
    // MARK: Object lifecycle
    var displayMonuments: [MonumentListScene.getList.ViewModel.MonumentView] = []
    var id = ""
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    private func setup() {
        dependencyInjector.inject(to:self)
    }
    
    
    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        getList()
    }

    
    // MARK: Requests
    func getList() {
        let request = MonumentListScene.getList.Request()
        interactor?.getList(request: request)
    }
    
    // MARK: Display logic
    func displayGetListSuccess(viewModel: MonumentListScene.getList.ViewModel) {
        displayMonuments = viewModel.displayListMonumentView.list
        self.tableView.reloadData()
    }
    
    func displayGetListError(viewModel: MonumentListScene.getList.ViewModel) {
        debugPrint("Error obtaining Monuments")
    }
}

extension MonumentListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                id = displayMonuments[indexPath.row].id
                print("El id es \(id)")
                let data = segue.destination as! MonumentDetailViewController
                data.id = id
            }
        }
    }
}
