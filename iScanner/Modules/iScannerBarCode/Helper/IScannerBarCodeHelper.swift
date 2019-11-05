//
//  IScannerBarCodeHelper.swift
//  iScanner
//
//  Created by Shafeer P on 05/11/19.
//  Copyright © 2019 Shafeer P. All rights reserved.
//

import Foundation

/// Delegate callback for the QRScannerView.
protocol QRScannerViewDelegate: class {
    func qrScanningDidFail()
    func qrScanningSucceededWithCode(_ str: String?)
    func qrScanningDidStop()
}

/// Delegate callback for the IScannerBarCodeController.

protocol IScannerBarCodeControllerDelegate: class {
    func qrScanningSucceededWithCode(_ str: String?)
}
