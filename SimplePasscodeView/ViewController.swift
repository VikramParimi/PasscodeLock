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
        passcodeView.pinfillColor = UIColor.green
        passcodeView.isSecureEntry = false
        passcodeView.pinfont = UIFont.boldSystemFont(ofSize: 25)
        passcodeView.pinfontColor = UIColor.blue
    }
}

extension ViewController: SimplePasscodeDelegate {
    func didFinishEntering(_ passcode: String) {
        print("passcode: \(passcode)")
    }
}

