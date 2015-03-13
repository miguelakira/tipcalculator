//
//  ViewController.swift
//  TipCalculator
//
//  Created by Miguel Akra on 3/13/15.
//  Copyright (c) 2015 Miguel Akra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // exclamation mark says that the variables have optional values, but the app will crash if not set.
    // basically means that I'm sure that they will be set.
    @IBOutlet var totalTextField : UITextField!
    @IBOutlet var taxPercentageSlider : UISlider!
    @IBOutlet var taxPercentageLabel : UILabel!
    @IBOutlet var resultsTextView : UITextView!
    
    // callbacks for actions from views, they always need to have this same signature – a function with no return
    // value, that takes a single parameter of type AnyObject as a parameter, which represents a class of any type.
    @IBAction func calculateTapped(sender : AnyObject) {
        // convert string to double. I have to first convert string to NSString, because
        // string does not have the method to convert itself to double, but NSString does
        // http://stackoverflow.com/questions/24031621/swift-how-to-convert-string-to-double
        tipCalc.total = Double((totalTextField.text as NSString).doubleValue)

        var results = tipCalc.calcTipWithTipPct(tipCalc.taxPercentage)
//        var results = "\(tipCalc.total)*: \(tipCalc.taxPercentage)\n"

        resultsTextView.text = "\(tipCalc.calcTipWithTipPct(tipCalc.taxPercentage))"
    }
    @IBAction func taxPercentageChanged(sender : AnyObject) {
        tipCalc.taxPercentage = Double(taxPercentageSlider.value) / 100.0
        refreshUI()
    }
    @IBAction func viewTapped(sender : AnyObject) {
        // resignFirstResponder will dismiss the keyboard
        totalTextField.resignFirstResponder()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let tipCalc = TipCalculatorModel(total: 100.0, taxPercentage: 0.06)
    
    func refreshUI() {
        // convert tipCalc.total from a Double to a String.
        totalTextField.text = String(format: "%0.2f", tipCalc.total)
        // display tax percentage as integer. Cast because .value is Float, not Double
        taxPercentageSlider.value = Float(tipCalc.taxPercentage) * 100.0
        // interpolate string (my god the uglyness!)
        taxPercentageLabel.text = "Tax Percentage (\(Int(taxPercentageSlider.value))%)"
        // clear the resultsTextView
        resultsTextView.text = ""
    }


}

