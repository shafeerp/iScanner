//
//  IScannerMyBarcodesController+Delegates.swift
//  iScanner
//
//  Created by Shafeer P on 05/11/19.
//  Copyright © 2019 Shafeer P. All rights reserved.
//

import UIKit
extension IScannerMyBarcodesController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scannedDatum.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = scannedDatum[indexPath.row].text
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard let id = scannedDatum[indexPath.row].id else { return }
        if editingStyle == .delete {
            CoreDataManager.deleteData(id)
            getScannedItems()
        }
    }
}
