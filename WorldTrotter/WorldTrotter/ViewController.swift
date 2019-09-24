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
    @IBOutlet weak var fahrenheitTextField: UITextField!
    var formatter: NumberFormatter = {
            let fmt = NumberFormatter()
            fmt.numberStyle = .decimal
            fmt.minimumFractionDigits = 0
            fmt.maximumFractionDigits = 1
            return fmt
        }()

    
    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet {
            if let celsiusValue = celsiusValue {
                celsiusLabel.text = formatter.string(from: NSNumber(value: celsiusValue.value))
            } else {
                celsiusLabel.text = "???"
            }
            
        }
    }
    
    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func fahrenheitFieldChanged(_ sender: UITextField) {
        if let text = sender.text, !text.isEmpty, let value = Double(text){
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    @IBAction func tapDetected(_ sender: UITapGestureRecognizer) {
        fahrenheitTextField.resignFirstResponder()
    }

}
