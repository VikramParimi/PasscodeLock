//
//  ViewController.swift
//  SimplePasscodeView
//
//  Copyright © 2018 Geeko Coco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var passcodeView: SimplePasscodeView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        passcodeView.delegate = self
        
        passcodeView.isSecureEntry = true
        passcodeView.length = 7
    
        passcodeView.keyboardType = .numberPad
        
    //    passcodeView.pinborderColor = UIColor.brown.cgColor
    //    passcodeView.pinfillColor = UIColor.black
    }
}

extension ViewController: SimplePasscodeDelegate {
    func didDeleteBackward() {
         //Do whatever you want
    }
    
    func didFinishEntering(_ passcode: String) {
        //Do whatever you want
        print("passcode: \(passcode)")
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "TestViewController")
        navigationController?.pushViewController(vc, animated: true)
    }
}

