//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Ryan Henzell-Hill on 19/06/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var splitBill: Double?
    var split: Int?
    var tip: Int?
    
    @IBOutlet weak var splitBillLabel: UILabel!
    @IBOutlet weak var billDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        splitBillLabel.text = "\(round((splitBill ?? 0.0) * 100) / 100)"
        billDescriptionLabel.text = "Split between \(split ?? 0) people, with \(tip ?? 0)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
