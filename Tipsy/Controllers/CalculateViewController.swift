//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var tip: Double?
    var splitBill: Double?
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var splitLabel: UILabel!
    
    @IBOutlet weak var tip0Button: UIButton!
    @IBOutlet weak var tip10Button: UIButton!
    @IBOutlet weak var tip20Button: UIButton!
    
    @IBOutlet weak var splitStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetTipButtons()
        tip0Button.isSelected = true
    }
    
    func resetTipButtons() {
        tip0Button.isSelected = false
        tip10Button.isSelected = false
        tip20Button.isSelected = false
    }
    
    @IBAction func tip0Pressed(_ sender: UIButton) {
        resetTipButtons()
        tip = 0.0
        tip0Button.isSelected = true
    }
    
    @IBAction func tip10Pressed(_ sender: UIButton) {
        resetTipButtons()
        tip = 0.1
        tip10Button.isSelected = true
    }
    
    @IBAction func tip20Pressed(_ sender: UIButton) {
        resetTipButtons()
        tip = 0.2
        tip20Button.isSelected = true
    }
    
    @IBAction func splitChanged(_ sender: UIStepper) {
        splitLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        guard let totalBillText = billTextField.text else { return }
        guard let totalBill = Double(totalBillText) else { return }
        let billPlusTip = totalBill * (1 + (tip ?? 0.0))
        splitBill = billPlusTip / splitStepper.value
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.splitBill = splitBill
        }
    }
}

