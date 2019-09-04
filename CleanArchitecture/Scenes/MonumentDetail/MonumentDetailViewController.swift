//
//  MonumentDetailViewController.swift
//  CleanArchitecture
//
//  Created by Roberto on 03/09/2019.
//  Copyright © 2019 Marcos Molero. All rights reserved.
//

import UIKit

protocol MonumentDetailDisplayLogic: class {
    func displayGetDetailSuccess(viewModel: MonumentDetailScene.getDetail.ViewModel)
    func displayGetDetailError(viewModel: MonumentDetailScene.getDetail.ViewModel)
}

class MonumentDetailViewController: UIViewController, MonumentDetailDisplayLogic {

    var interactor: MonumentDetailBusinessLogic?
    var router: (MonumentDetailRoutingLogic & MonumentDetailDataPassing)?
    var dependencyInjector:SceneDependencyInjector! = MonumentDetailDependencyInjector()
    
    var id: String? = nil
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var transportLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var geocoordinatesLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    // MARK: Object lifecycle

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
        print("El id es: \(String(describing: id))")
        getDetail()
    }
    
    
    // MARK: Requests
    func getDetail() {
        let request = MonumentDetailScene.getDetail.Request(id: id ?? "-1")
        interactor?.getDetail(id: id ?? "-1", request: request)
    }
    
    // MARK: Display logic
    func displayGetDetailSuccess(viewModel: MonumentDetailScene.getDetail.ViewModel) {
        
        titleLabel.text = viewModel.displayDetailMonumentView.title
        idLabel.text = viewModel.displayDetailMonumentView.id
        transportLabel.text = viewModel.displayDetailMonumentView.transport
        emailLabel.text = viewModel.displayDetailMonumentView.email
        geocoordinatesLabel.text = viewModel.displayDetailMonumentView.geocoordinates
        phoneLabel.text = viewModel.displayDetailMonumentView.phone
        descriptionText.text = viewModel.displayDetailMonumentView.description
    }
    
    func displayGetDetailError(viewModel: MonumentDetailScene.getDetail.ViewModel) {
        debugPrint("Error obtaining Monument Detail")
    }
    
}

extension MonumentDetailViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router?.passDataToNextScene(for: segue)
        
    }
}

