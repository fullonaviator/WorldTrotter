//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Burton, Andrew M on 9/17/19.
//  Copyright © 2019 Burton, Andrew M. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var celsiusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func fahrenheitFieldChanged(_ sender: UITextField) {
        print("text=\(sender.text)")
    }
    
}

