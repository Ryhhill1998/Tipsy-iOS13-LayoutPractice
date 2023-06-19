//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Ryan Henzell-Hill on 19/06/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    var tip = 0.0
    var split = 2.0
    var result: Result?
    
    mutating func calculateBill(bill: Double) {
        let billPlusTip = bill * (1 + tip / 100)
        let splitBill = billPlusTip / split
        result = Result(value: splitBill, description: "Split between \(Int(split)) people, with \(Int(tip))% tip.")
    }
    
    mutating func setTip(tip: Double) {
        self.tip = tip
    }
    
    mutating func setSplit(split: Double) {
        self.split = split
    }
    
    func getResultValue() -> Double {
        return result?.value ?? 0.0
    }
    
    func getResultDescription() -> String {
        return result?.description ?? "No description"
    }
}
