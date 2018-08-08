//
//  ViewController.swift
//  MHPasscodeView
//
//  Created by Pairmi, Vikram (US - Bengaluru) on 8/7/18.
//  Copyright © 2018 vikram. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var passcodeView: MHPasscodeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        passcodeView.type = .participantId
    }
    
}

