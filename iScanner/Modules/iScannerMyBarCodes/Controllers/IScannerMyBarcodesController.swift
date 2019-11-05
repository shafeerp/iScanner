//
//  IScannerMyBarcodesController.swift
//  iScanner
//
//  Created by Shafeer P on 05/11/19.
//  Copyright © 2019 Shafeer P. All rights reserved.
//

import UIKit

class IScannerMyBarcodesController: UIViewController {
    
    lazy var myBarcodesTableView : UITableView = {
        let myBarcodesTableView = UITableView()
        myBarcodesTableView.tableFooterView = UIView()
        return myBarcodesTableView
    }()
    
    lazy var labelEmpty : UILabel = {
        let labelEmpty = UILabel()
        labelEmpty.font = UIFont(name: "Rockwell-Regular", size: 16)
        labelEmpty.text = IScannerConstants.IScannerMyScans.EmptyLabelText
        labelEmpty.textAlignment = .center
        labelEmpty.textColor = UIColor.rgb(red: 62, green: 62, blue: 82, alpha: 1)
        return labelEmpty
    }()
    
    lazy var scanButton : UIButton = {
        
        let scanButton = UIButton()
        scanButton.backgroundColor = UIColor.rgb(red: 61, green: 131, blue: 218, alpha: 1)
        scanButton.titleLabel?.font = UIFont(name: "Rockwell-Regular", size: 17)
        scanButton.titleLabel?.textColor = UIColor.white
        scanButton.setTitle(IScannerConstants.IScannerMyScans.ScanButtonText, for: .normal)
        scanButton.layer.cornerRadius = 20
        scanButton.addTarget(self, action: #selector(handleScan), for: .touchUpInside)
        return scanButton
    }()
    
    var scannedDatum                        : [IScannerScannedDatum] = []
    weak var delegate                       : IScannerMyBarCodesDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        getScannedItems()
    }
    
    @objc func handleScan() {
        delegate?.scanBarCode()
    }


}
