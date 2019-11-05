//
//  IScannerConstants.swift
//  iScanner
//
//  Created by Shafeer P on 05/11/19.
//  Copyright © 2019 Shafeer P. All rights reserved.
//

import Foundation

struct IScannerConstants {
    
    struct IScannerHome {
        static let ScanBarCode                  = "Scan BarCode"
        static let MyScannedList                = "My Scans"
    }
    struct IScannerBarCodeScanning {
        static let StartScan                    = "Start Scanning"
    }
    struct IScannerStorage {
        static let ScannedDataEntity            = "ScannedItems"
        static let TextAttribute                = "text"
    }
    struct IScannerMyScans {
        static let EmptyLabelText               = "No scanned items found"
        static let ScanButtonText               = "Scan Barcode"
    }
}
