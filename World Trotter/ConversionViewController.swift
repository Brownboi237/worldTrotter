//
//  ConversionViewController.swift
//  World Trotter
//
//  Created by Marco Aguilar on 9/1/17.
//  Copyright © 2017 Brown Space Mango. All rights reserved.
//

import UIKit


class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    
    var fahrenheitValue: Measurement<UnitTemperature>? { //property observer, there are two, is either "willSet" or "didSet"
        didSet { // "didSet" gets called after the property value changes
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue: Measurement<UnitTemperature>? { //this checks to see if there is a fahrenheitValue
        if let fahrenheitValue = fahrenheitValue { //therefore this checks to see if fahrenheitValue equals a fahrenheitValue
            return fahrenheitValue.converted(to: .celsius) // if it does it converts it to celsius
        } else {
            return nil // otherwise it returns nothing
        }
    }
    
    var numberFormatter: NumberFormatter  = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
        if let text = textField.text, let value = Double(text) { // first check to see if the textField has text. if so, check to see whether that text can be rep by a "Double" "3.14"
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit) //if passes checks than fahrenheitValue is set to a measurment initialized with that Double value.
        } else {
            fahrenheitValue = nil // if either of those checks fail than it is set to nil
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) { //changes the color of "ConversionViewController" depending on the time of day
        let date = Date()
        let hour = Calendar.current.component(.hour, from: date)
        
        if hour > 17 || hour < 6 {
            self.view.backgroundColor=UIColor.darkGray
        }
        
        print("ConversionViewController loaded its view.")
        
        updateCelsiusLabel() // this updates the celsiusLabel instead of still showing the value of "100"
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
    func updateCelsiusLabel() {
        if let celsiusValue = celsiusValue {
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        
        if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
            return false
        } else {
            return true
        }
}


}


