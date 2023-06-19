//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Ryan Henzell-Hill on 19/06/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var resultValue: Double?
    var resultDescription: String?
    
    @IBOutlet weak var splitBillLabel: UILabel!
    @IBOutlet weak var billDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        splitBillLabel.text = "\(resultValue ?? 0.0)"
        billDescriptionLabel.text = resultDescription
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
