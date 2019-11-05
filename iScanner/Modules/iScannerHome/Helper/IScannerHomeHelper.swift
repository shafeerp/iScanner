//
//  IScannerHomeHelper.swift
//  iScanner
//
//  Created by Shafeer P on 05/11/19.
//  Copyright © 2019 Shafeer P. All rights reserved.
//

import Foundation

protocol IScannerSliderProtocol {
    func didChangeSlider(_ value:Int)
}

enum IScannerTabType:Int,CaseIterable {
    case scanbarcode = 0
    case mybarcodes = 1
}
