//
//  IScannerSliderSelectionView.swift
//  iScanner
//
//  Created by Shafeer P on 05/11/19.
//  Copyright © 2019 Shafeer P. All rights reserved.
//

import UIKit

@IBDesignable
class IScannerSliderSelectionView: UISegmentedControl {

    lazy var buttonBar : UIView = {
        let view = UIView()
        return view
    }()
    
    @IBInspectable var segmentBackgroundColor : UIColor? {
        didSet {
            setupSegment()
        }
    }
    @IBInspectable var isBottomBarHidden : Bool = false {
        didSet {
            setupSegment()
        }
    }
    
    @IBInspectable var segmentTintColorColor : UIColor? {
        didSet {
            setupSegment()
        }
    }
    
    @IBInspectable var segmentTitles : [String]? {
        didSet {
            setupSegment()
        }
    }
    
    @IBInspectable var selectedTitleAttribule : [NSAttributedString.Key:Any]? {
        didSet {
            setupSegment()
        }
    }
    
    @IBInspectable var normalTitleAttribule : [NSAttributedString.Key:Any]? {
        didSet {
            setupSegment()
        }
    }
    
    @IBInspectable var selectionBarColor : UIColor? {
        didSet {
            setupSegment()
        }
    }
    
    @IBInspectable var selectedSegmentIndexValue : Int = 0 {
        didSet {
            setupSegment()
        }
    }
    
    var delegate        : IScannerSliderProtocol?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSegment()
    }
    
    fileprivate func setupSegment() {
        
        addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: UIControl.Event.valueChanged)
        removeAllSegments()
        
        guard let segmentTitles = segmentTitles else { return }
        
        for segment in segmentTitles  {
            insertSegment(withTitle: segment, at: self.numberOfSegments, animated: true)
        }
        selectedSegmentIndex = 0
        
        backgroundColor = segmentBackgroundColor ?? .clear
        tintColor = segmentTintColorColor ?? .clear
        setTitleTextAttributes(normalTitleAttribule, for: .normal)
        setTitleTextAttributes(selectedTitleAttribule, for: .selected)
        
        buttonBar.backgroundColor = selectionBarColor ?? UIColor.red
        setupLayout()
        
    }
    
    fileprivate func setupLayout() {
        
        removeAllConstraints()
        buttonBar.removeAllConstraints()
        
        buttonBar.translatesAutoresizingMaskIntoConstraints = false
        
        if isBottomBarHidden {
            buttonBar.removeFromSuperview()
        }
            
        else {
            addSubview(buttonBar)
            buttonBar.topAnchor.constraint(equalTo: bottomAnchor).isActive = true
            buttonBar.heightAnchor.constraint(equalToConstant: 3).isActive = true
            buttonBar.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
            
            buttonBar.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1 / CGFloat(numberOfSegments)).isActive = true
        }
    }
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        UIView.animate(withDuration: 0.3) {
            self.buttonBar.frame.origin.x = (self.frame.width / CGFloat(self.numberOfSegments)) * CGFloat(self.selectedSegmentIndex)
        }
        delegate?.didChangeSlider(sender.selectedSegmentIndex)
    }
    
    func updateSegment(_ index : Int) {
        if selectedSegmentIndex != index {
            selectedSegmentIndex = index
            sendActions(for: .valueChanged)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    
}
