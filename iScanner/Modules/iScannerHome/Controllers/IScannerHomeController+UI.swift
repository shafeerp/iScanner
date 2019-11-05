//
//  IScannerHomeController+UI.swift
//  iScanner
//
//  Created by Shafeer P on 05/11/19.
//  Copyright © 2019 Shafeer P. All rights reserved.
//

import UIKit

//Mark:- For UI Setup

extension IScannerHomeController {
    func setupUI() {
        self.view.backgroundColor = UIColor.white
        self.sliderSelection.backgroundColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1.0)
        setupSubviews()
        setupSelectionSlider()
        setupConstraints()
        setupPagination()
    }
    fileprivate func setupSubviews() {
        view.addSubview(sliderSelection)
        
    }
    
    fileprivate func setupConstraints() {
        
        sliderSelection.anchors(top: view.safeAreaLayoutGuide.topAnchor, topConstants: 20, leading: view.safeAreaLayoutGuide.leadingAnchor, leadingConstants: 20,trailing: view.safeAreaLayoutGuide.trailingAnchor, trailingConstants: -20, heightConstants: 60)

    }
    
    fileprivate func setupSelectionSlider() {
        
        sliderSelection.normalTitleAttribule = [NSAttributedString.Key.foregroundColor: UIColor.lightGray,  NSAttributedString.Key.font:UIFont(name: "Rockwell-Regular", size: 17) as Any]
        sliderSelection.selectedTitleAttribule = [NSAttributedString.Key.foregroundColor:UIColor.rgb(red: 61, green: 131, blue: 218, alpha: 1), NSAttributedString.Key.font:UIFont(name: "Rockwell-Regular", size: 17) as Any]
        sliderSelection.buttonBar.backgroundColor = UIColor.rgb(red: 61, green: 131, blue: 218, alpha: 1)
    }
    
    fileprivate func setupPagination() {
        IScannerTabType.allCases.forEach{ allTabs.append($0) }
        pageController.view.clipsToBounds = true
        guard let initialVC = getViewController(.scanbarcode) else { return }
        pageController.setViewControllers([initialVC], direction: .forward, animated: false, completion: nil)
        self.addChild(pageController)
        
        let pageView = pageController.view!
        self.view.addSubview(pageView)
        pageView.anchors(top: sliderSelection.bottomAnchor, topConstants: 15, leading: view.leadingAnchor, leadingConstants: 0, bottom: view.bottomAnchor, bottomConstants: 0, trailing: view.trailingAnchor, trailingConstants: 0)
        pageController.didMove(toParent: self)
        pageView.backgroundColor = UIColor.clear
    }
}
