//
//  IScannerMyBarcodesController+Storage.swift
//  iScanner
//
//  Created by Shafeer P on 05/11/19.
//  Copyright © 2019 Shafeer P. All rights reserved.
//

import Foundation

extension IScannerMyBarcodesController {
    func getScannedItems() {
        labelEmpty.removeFromSuperview()
        scanButton.removeFromSuperview()
        scannedDatum = []
        CoreDataManager.retreaveScannedData().forEach{ scannedDatum.append($0)}
        if scannedDatum.isEmpty {
            setupAndShowEmptyView()
        }
        DispatchQueue.main.async {
            self.myBarcodesTableView.reloadData()
        }

    }
}
