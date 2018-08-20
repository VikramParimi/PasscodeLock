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
    }
}

extension ViewController: SimplePasscodeDelegate {
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

