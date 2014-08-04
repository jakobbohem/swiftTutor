//
//  ViewController.swift
//  TipCalculator
//
//  Created by Jakob Rydén on 16/07/14.
//  Copyright (c) 2014 Jakob Rydén. All rights reserved.
//

import UIKit

class UIViewController {
}

class ViewController: UIKit.UIViewController {

    @IBOutlet var totalTextField: UITextField
    @IBOutlet var taxPctSlider : UISlider
    @IBOutlet var taxPctLabel : UILabel
    @IBOutlet var resultTextView : UITextView

    let tipCalc = TipCalculatorModel(total: 100, taxPct: 0.06)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func refreshUI() {
        totalTextField.text = String(tipCalc.total)
        taxPctSlider.value = Float(tipCalc.taxPct) * 100
        taxPctLabel.text = "Tax Percentage, (\(Int(taxPctSlider.value))%)"

        resultTextView.text = ""
    }

    @IBAction func calculateTapped(sender: AnyObject) {
        //1
        tipCalc.total = Double(totalTextField.text.bridgeToObjectiveC().doubleValue)

        //2
        let possibleTips = tipCalc.getTips()
        var results = ""

        //3
        for (tipPct, tipValue) in possibleTips {
            results += "\(tipPct)%: \(tipValue)\n"
        }

        //4
        resultTextView.text = results;
    }
    @IBAction func taxPercentageChanged(sender: AnyObject) {
        tipCalc.taxPct = Double(taxPctSlider.value) / 100.0
        refreshUI()
    }
    @IBAction func viewTapped(sender: AnyObject) {
        totalTextField.resignFirstResponder()
    }

}

