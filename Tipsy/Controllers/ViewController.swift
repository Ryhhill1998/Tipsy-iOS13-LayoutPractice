//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tip: Float?
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var splitLabel: UILabel!
    
    @IBOutlet weak var tip0Button: UIButton!
    @IBOutlet weak var tip10Button: UIButton!
    @IBOutlet weak var tip20Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetTipButtons()
    }
    
    func resetTipButtons() {
        tip0Button.isSelected = false
        tip10Button.isSelected = false
        tip20Button.isSelected = false
    }
    
    @IBAction func tipPressed(_ sender: UIButton) {
        resetTipButtons()
        tip = (Float(sender.titleLabel!.text!.components(separatedBy: "%")[0]) ?? 0.0) / 100.0
        sender.isSelected = true
    }
    
    @IBAction func splitChanged(_ sender: UIStepper) {
        splitLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let totalBill = (Float(billTextField.text! ) ?? 0.0) * (1 + (tip ?? 0.0))
        print(totalBill)
    }
}

