//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Burton, Andrew M on 9/17/19.
//  Copyright © 2019 Burton, Andrew M. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

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
        print ("Convert ViewDidLoad")
        
        fahrenheitTextField.delegate = self
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print ("Convert ViewDidAppear")
    }

    @IBAction func fahrenheitFieldChanged(_ sender: UITextField) {
        if let text = sender.text, !text.isEmpty, let value = formatter.number(from: text){
            fahrenheitValue = Measurement(value: value.doubleValue, unit: .fahrenheit)
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    @IBAction func tapDetected(_ sender: UITapGestureRecognizer) {
        fahrenheitTextField.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let locale = Locale.current
        let dSep = locale.decimalSeparator ?? "."
        if textField.text?.contains(dSep) == true &&
            string.contains(dSep) {
            return false
        } else {
            return true
        }
    }

}
