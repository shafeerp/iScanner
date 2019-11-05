//
//  IScannerMyBarcodesController+UI.swift
//  iScanner
//
//  Created by Shafeer P on 05/11/19.
//  Copyright © 2019 Shafeer P. All rights reserved.
//

import UIKit
extension IScannerMyBarcodesController {
    func setupUI() {
        setupSubviews()
        setupConstraints()
        setupmyBarcodesTableView()
    }
    fileprivate func setupSubviews() {
        view.addSubview(myBarcodesTableView)
    }
    
    fileprivate func setupConstraints() {
        myBarcodesTableView.anchors(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor,  trailing: view.trailingAnchor)
    }
    
    fileprivate func setupmyBarcodesTableView() {
        myBarcodesTableView.delegate = self
        myBarcodesTableView.dataSource = self
        
    }
    
    func setupAndShowEmptyView() {
        
        myBarcodesTableView.addSubview(labelEmpty)
        myBarcodesTableView.addSubview(scanButton)
        
        labelEmpty.anchors(widthConstants: myBarcodesTableView.frame.width, centerX: view.centerXAnchor, centerXConstants: 0, centerY: view.centerYAnchor, centerYConstants:-100)
        
        scanButton.anchors(top: labelEmpty.bottomAnchor, topConstants: 12,heightConstants:40,widthConstants:200, centerX: labelEmpty.centerXAnchor, centerXConstants: 0)
    }

}
