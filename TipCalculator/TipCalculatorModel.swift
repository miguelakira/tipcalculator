//
//  TipCalculatorModel.swift
//  TipCalculator
//
//  Created by Miguel Akra on 3/13/15.
//  Copyright (c) 2015 Miguel Akra. All rights reserved.
//

import Foundation

class TipCalculatorModel {
    
    var total: Double
    var taxPercentage: Double
    // computed property, does not store value
    var subtotal: Double {
        get {
            return total / (taxPercentage + 1)
        }
    }
    
    init(total: Double, taxPercentage: Double) {
        self.total = total
        self.taxPercentage = taxPercentage
    }
    
    func calcTipWithTipPct(tipPercentage: Double) -> Double {
        return subtotal * tipPercentage
    }
    
}