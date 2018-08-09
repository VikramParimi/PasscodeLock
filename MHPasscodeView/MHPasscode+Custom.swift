//
//  MHPasscode+Custom.swift
//  MHPasscodeView
//
//  Copyright © 2018 vikram. All rights reserved.
//

import UIKit

public enum MHPasscode {
    case accessCode
    case participantId
    case other
}

extension MHPasscode {
    
    var placeHolderViews: [PinView] {
        var views = [PinView]()
        for _ in 0..<self.length {
            let pinView: PinView = PinView()
            pinView.translatesAutoresizingMaskIntoConstraints = false
            pinView.widthAnchor.constraint(equalToConstant: 30).isActive = true
            pinView.heightAnchor.constraint(equalToConstant: 40).isActive = true
            
            pinView.secureEntry = self.secureEntry
            
            pinView.indicator = Indicator()
            pinView.indicator?.translatesAutoresizingMaskIntoConstraints = false
            
            pinView.indicator?.widthAnchor.constraint(equalToConstant: 10).isActive = true
            pinView.indicator?.heightAnchor.constraint(equalToConstant: 10).isActive = true
            pinView.indicator?.centerXAnchor.constraint(equalTo: pinView.centerXAnchor).isActive = true
            pinView.indicator?.centerYAnchor.constraint(equalTo: pinView.centerYAnchor).isActive = true
            
            views.append(pinView)
        }
        return views
    }
    
    var length: Int {
        get {
            switch self {
            case .accessCode:
                return 6
            case .participantId:
                return 7
            case .other:
                return 10
            }
        }
    }
    
    var offset: Int {
        get {
            switch self {
            case .accessCode:
                return -1
            case .participantId:
                return 3
            case .other:
                return 2
            }
        }
    }
    
    var spacing: CGFloat {
        get {
            return 5
        }
    }
    
    var secureEntry: Bool {
        get {
            switch self {
            case .accessCode:
                return true
            case .participantId, .other:
                return false
            }
        }
    }
}

class PinView: UIView {
    
    var secureEntry: Bool = true
    var isFilled: Bool    = false
    
    var indicator: Indicator? {
        didSet {
            guard let view = indicator else { return }
            addSubview(view)
        }
    }
    var pinText: String? {
        didSet {
            guard let pinText = pinText else {
                pinLabel.isHidden = true
                indicator?.isHidden = false
                return
            }
            updateLabelApperance(pinText)
        }
    }
    
    private lazy var pinLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func updateIndicatorApperance() {
        if isFilled {
            indicator?.fillView()
        } else {
            indicator?.clearView()
        }
    }
    
    func updateLabelApperance(_ pinText: String) {
        pinLabel.font = UIFont.systemFont(ofSize: 22)
        pinLabel.textColor = UIColor.black
        pinLabel.text = pinText
        addSubview(pinLabel)
        pinLabel.isHidden = false
        
        pinLabel.translatesAutoresizingMaskIntoConstraints = false
        pinLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        pinLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}

class Indicator: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        rounded()
    }
}

extension Indicator {
    func rounded() {
        layer.cornerRadius = frame.width / 2
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func clearView() {
        backgroundColor = UIColor.clear
    }
    
    func fillView() {
        backgroundColor = UIColor.lightGray
    }
}

class PinLabel: UILabel {
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
