//
//  IScannerHomeController+Pagination.swift
//  iScanner
//
//  Created by Shafeer P on 05/11/19.
//  Copyright © 2019 Shafeer P. All rights reserved.
//

import Foundation
import UIKit

//Mark:= Pagination Methods
extension IScannerHomeController {
    func getViewController(_ tType:IScannerTabType) -> UIViewController? {
        switch tType {
        case .mybarcodes:
            return getMyBarCodeScansController()
        case .scanbarcode:
            return getBarCodeScanningController()
        }
    }
    
    func performPagination(_ tType:IScannerTabType) {
        
        var preferredIndex = 0
        var newIndex = 0
        
        if allTabs.contains(tType),
            allTabs.contains(preferredTab),
            let prefIndex = allTabs.index(of: preferredTab),
            let newInd = allTabs.index(of: tType) {
            
            preferredIndex = prefIndex
            newIndex = newInd
        }
        
        guard let initialVC = getViewController(tType) else { return }
        
        
        let direction: UIPageViewController.NavigationDirection = preferredIndex > newIndex ? .reverse : .forward
        
        pageController.setViewControllers([initialVC], direction: direction, animated: true, completion: nil)
        
        preferredTab = tType
    }
    func getBarCodeScanningController() -> UIViewController? {
        if barCodeScannerController != nil {
            return barCodeScannerController
            
        }
        barCodeScannerController = IScannerBarCodeController()
        barCodeScannerController?.delegate = self
        return barCodeScannerController
    }
    
    func getMyBarCodeScansController() -> UIViewController? {
        if myBarCodesController != nil {
            return myBarCodesController
        }
        myBarCodesController = IScannerMyBarcodesController()
        myBarCodesController?.delegate = self
        return myBarCodesController
    }
}
