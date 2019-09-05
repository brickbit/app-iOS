//
//  MonumentListCell.swift
//  CleanArchitecture
//
//  Created by Roberto on 02/09/2019.
//  Copyright © 2019 Marcos Molero. All rights reserved.
//

import Foundation
import UIKit

class MonumentListCell: UITableViewCell {
    
    @IBOutlet weak var geocoordinatesLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    func setup(monument: MonumentListScene.getList.ViewModel.MonumentView) {
        geocoordinatesLabel.text = monument.geocoordinates
        titleLabel.text = monument.title
        idLabel.text = monument.id
    }
    
    
    
}
