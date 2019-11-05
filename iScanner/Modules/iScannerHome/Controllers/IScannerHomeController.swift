//
//  IScannerHomeController.swift
//  iScanner
//
//  Created by Shafeer P on 05/11/19.
//  Copyright © 2019 Shafeer P. All rights reserved.
//

import UIKit

class IScannerHomeController: UIViewController {
    
    lazy var sliderSelection : IScannerSliderSelectionView = {
        let sliderView = IScannerSliderSelectionView(frame: CGRect.zero)
        sliderView.segmentTitles = [IScannerConstants.IScannerHome.ScanBarCode, IScannerConstants.IScannerHome.MyScannedList]
        sliderView.delegate = self
        return sliderView
    }()
    
    lazy var pageController : UIPageViewController = {
        var pageController = UIPageViewController(transitionStyle: UIPageViewController.TransitionStyle.scroll, navigationOrientation: UIPageViewController.NavigationOrientation.horizontal, options: nil)
        pageController.view.backgroundColor = UIColor.clear
        return pageController
    }()
    
    var allTabs                         = [IScannerTabType]()
    var preferredTab                    : IScannerTabType = .scanbarcode
    var barCodeScannerController        : IScannerBarCodeController?
    var myBarCodesController            : IScannerMyBarcodesController?
    


    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}
