//
//  IScannerHomeController+Delgates.swift
//  iScanner
//
//  Created by Shafeer P on 05/11/19.
//  Copyright © 2019 Shafeer P. All rights reserved.
//

import Foundation

//Mark:= For Delegate Methods

extension IScannerHomeController : IScannerSliderProtocol {
    func didChangeSlider(_ value: Int) {
        let newModule = IScannerTabType(rawValue: value) ?? .scanbarcode
        barCodeScannerController?.showCustomView(false)
        performPagination(newModule)
    }
}

extension IScannerHomeController : IScannerBarCodeControllerDelegate {
    func qrScanningSucceededWithCode(_ str: String?) {
        
        CoreDataManager.addNewData(IScannerScannedDatum(id: nil, text:str ?? ""))
        sliderSelection.updateSegment(IScannerTabType.mybarcodes.rawValue)
    }
}
extension IScannerHomeController : IScannerMyBarCodesDelegate {
    func scanBarCode() {
        sliderSelection.updateSegment(IScannerTabType.scanbarcode.rawValue)
        barCodeScannerController?.showScannerView()
    }
    
    
}
