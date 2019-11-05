//
//  IScannerBarCodeController.swift
//  iScanner
//
//  Created by Shafeer P on 05/11/19.
//  Copyright © 2019 Shafeer P. All rights reserved.
//

import UIKit

class IScannerBarCodeController: UIViewController {
    
    lazy var startScanButton : UIButton = {
        let startScanButton = UIButton()
        startScanButton.setTitle(IScannerConstants.IScannerBarCodeScanning.StartScan, for: .normal)
        startScanButton.backgroundColor = UIColor.rgb(red: 61, green: 131, blue: 218, alpha: 1)
        startScanButton.titleLabel?.font = UIFont(name: "Rockwell-Regular", size: 16)
        startScanButton.layer.cornerRadius = 20
        startScanButton.addTarget(self, action: #selector(handleStartScan), for: .touchUpInside)
        return startScanButton
    }()
    
    lazy var scannerView : QRScannerView = {
        let scannerView = QRScannerView()
        scannerView.delegate = self
        return scannerView
    }()
    
    weak var delegate               : IScannerBarCodeControllerDelegate?
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}
