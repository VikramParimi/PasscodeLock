//
//  TestViewController.swift
//  SimplePasscodeView
//
//  Created by Pairmi, Vikram (US - Bengaluru) on 8/26/18.
//  Copyright © 2018 vikram. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var passcodeView: SimplePasscodeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view, typically from a nib.
        passcodeView.delegate = self
        
        passcodeView.isSecureEntry = false
        passcodeView.length = 10
        passcodeView.keyboardType = .numberPad
        
     //   passcodeView.pinborderColor = UIColor.brown.cgColor
     //   passcodeView.pinfillColor = UIColor.black
    }
    
}

extension TestViewController: SimplePasscodeDelegate {
    func didDeleteBackward() {
        //Do whatever you want
    }
    
    func didFinishEntering(_ passcode: String) {
        //Do whatever you want
        print("passcode: \(passcode)")
        let alert = UIAlertController(title: "Passcode", message: passcode, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
}
