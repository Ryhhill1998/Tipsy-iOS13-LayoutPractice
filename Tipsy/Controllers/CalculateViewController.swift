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
    var calculatorBrain = CalculatorBrain()
    
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
        calculatorBrain.setTip(tip: 0.0)
        tip0Button.isSelected = true
    }
    
    @IBAction func tip10Pressed(_ sender: UIButton) {
        resetTipButtons()
        calculatorBrain.setTip(tip: 10.0)
        tip10Button.isSelected = true
    }
    
    @IBAction func tip20Pressed(_ sender: UIButton) {
        resetTipButtons()
        calculatorBrain.setTip(tip: 20.0)
        tip20Button.isSelected = true
    }
    
    @IBAction func splitChanged(_ sender: UIStepper) {
        let split = sender.value
        splitLabel.text = "\(Int(split))"
        calculatorBrain.setSplit(split: split)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        guard let totalBillText = billTextField.text else { return }
        guard let totalBill = Double(totalBillText) else { return }
        calculatorBrain.calculateBill(bill: totalBill)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.resultValue = calculatorBrain.getResultValue()
            destinationVC.resultDescription = calculatorBrain.getResultDescription()
        }
    }
}

