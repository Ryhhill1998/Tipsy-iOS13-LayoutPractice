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
    
    @IBOutlet weak var splitBillLabel: UILabel!
    @IBOutlet weak var billDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        splitBillLabel.text = "\(round((splitBill ?? 0.0) * 100) / 100)"
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
