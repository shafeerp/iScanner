//
//  IScannerBarCodeController+Delegates.swift
//  iScanner
//
//  Created by Shafeer P on 05/11/19.
//  Copyright © 2019 Shafeer P. All rights reserved.
//

import Foundation
extension IScannerBarCodeController : QRScannerViewDelegate {
    func qrScanningDidFail() {
        
    }
    
    func qrScanningSucceededWithCode(_ str: String?) {
        print(str ?? "")
        delegate?.qrScanningSucceededWithCode(str)
    }
    
    func qrScanningDidStop() {
        
    }
    
    
}
