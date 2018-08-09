//
//  MHPasscodeView.swift
//  MHPasscodeView
//
//  Copyright © 2018 vikram. All rights reserved.
//

import UIKit

open class MHPasscodeView: UIView, PasscodeConfigurable {
    
    private var passcodeText: String = ""
    
    private var placeHolderViews: [PinView] {
        var views = [PinView]()
        for _ in 0..<length {
            var pinView: PinView = PinView()
            pinView.translatesAutoresizingMaskIntoConstraints = false
            pinView.widthAnchor.constraint(equalToConstant: 30).isActive = true
            pinView.heightAnchor.constraint(equalToConstant: 40).isActive = true
            
            pinView.isSecureEntry = isSecureEntry
            
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
    
    @IBOutlet private weak var passcodeView: UIStackView!
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        updateView()
    }
    
    open override func layoutSubviews() {
        let _ = becomeFirstResponder()
    }
    
    open override var canBecomeFirstResponder: Bool {
        return true
    }
    
    open override func becomeFirstResponder() -> Bool {
        return super.becomeFirstResponder()
    }
    
    private func updateView() {
        passcodeView.spacing      = spacing
        passcodeView.distribution = .equalSpacing
        passcodeView.alignment    = .center
        for view in placeHolderViews {
            passcodeView.addArrangedSubview(view)
        }
    }
}

extension MHPasscodeView: UIKeyInput {
    
    public var keyboardType: UIKeyboardType {
        get {
            return .numberPad
        }
        set {
            self.keyboardType = newValue
        }
    }
    
    public var hasText: Bool {
        return !passcodeText.isEmpty
    }

    public func insertText(_ text: String) {
        
        guard canInsertCharacters() else { return }
        passcodeText.append(text)
        
        guard var view = passcodeView.arrangedSubviews.filter({ (view) -> Bool in
            if let pinView = view as? PinView,
                pinView.isFilled == false {
                return true
            }
            return false
        }).first as? PinView else { return  }
        
        view.isFilled = true
        toggleAppreanceOfPinview(view, text)
    }
    
    public func deleteBackward() {
        
        guard hasText else {
            return
        }
        passcodeText.removeLast()
        
        guard var view = passcodeView.arrangedSubviews.filter({ (view) -> Bool in
            if let pinView = view as? PinView,
                pinView.isFilled == true {
                return true
            }
            return false
        }).last as? PinView else { return  }
        
        view.isFilled = false
        toggleAppreanceOfPinview(view, nil)
    }
    
    func canInsertCharacters() -> Bool {
        if passcodeText.count != length {
            return true
        }
        return false
    }
    
    func toggleAppreanceOfPinview(_ view: PinView, _ pinText: String?) {
        if isSecureEntry {
            view.indicator?.isHidden = false
            view.updateIndicatorApperance()
        } else {
            view.indicator?.isHidden = true
            view.pinText = pinText
        }
    }
}
