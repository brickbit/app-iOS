//
//  MonumentListViewController+TableView.swift
//  CleanArchitecture
//
//  Created by Roberto on 02/09/2019.
//  Copyright © 2019 Marcos Molero. All rights reserved.
//

import Foundation
import UIKit

extension MonumentListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayMonuments.count

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return monumentsCell(tableView: tableView, cellForRowAt: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        id = displayMonuments[indexPath.row].id
    }
    
    func monumentsCell(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: MonumentListCell = tableView.dequeueReusableCell(withIdentifier: "monumentCell", for: indexPath) as? MonumentListCell {
                cell.setup(monument: displayMonuments[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableView(tableView, heightForRowAt: indexPath)
    }
    /*
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.tableView.reloadData()
    }*/
}
