//
//  IScannerBarCodeController+UI.swift
//  iScanner
//
//  Created by Shafeer P on 05/11/19.
//  Copyright © 2019 Shafeer P. All rights reserved.
//

import UIKit
extension IScannerBarCodeController {
    func setupUI() {
        setupSubviews()
        setupConstraints()
    }
    
    fileprivate func setupSubviews() {
        view.addSubview(startScanButton)
    }
    
    fileprivate func setupConstraints() {
        startScanButton.anchors(top: view.topAnchor, topConstants: 30, heightConstants: 48, widthConstants: 150, centerX: view.centerXAnchor)
        
    }
    
    func showScannerView(){
        let screenHeight = UIScreen.main.bounds.size.height
        let screenWidth  = UIScreen.main.bounds.size.width
        scannerView.frame = CGRect(x: 0, y: screenHeight, width: screenWidth, height: view.frame.height)
        view.addSubview(scannerView)
        showCustomView(true)
        scannerView.startScanning()
    }
    
    func showCustomView(_ show: Bool){
        let screenHeight = UIScreen.main.bounds.size.height
        let screenWidth  = UIScreen.main.bounds.size.width
        if (show)
        {
            UIView.animate(withDuration: 0.6, animations:  {
                self.scannerView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: self.view.frame.height)
            })
        }
        else{
            UIView.animate(withDuration: 0.7, animations:  {
                
                self.scannerView.frame = CGRect(x: 0, y: screenHeight, width: screenWidth, height: self.view.frame.height)
                
            })
        }
    }
}
