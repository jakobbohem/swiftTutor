//
//  TipCalculatorModel.swift
//  TipCalculator
//
//  Created by Jakob Rydén on 16/07/14.
//  Copyright (c) 2014 Jakob Rydén. All rights reserved.
//

import Foundation

class TipCalculatorModel
{
    var total: Double
    var taxPct: Double

    var subtotal: Double {
    get {
        return total / (taxPct+1)
    }
    set(newSubtotal) {
        //...
    }
    }

    init(total:Double, taxPct:Double)
    {
        self.total = total
        self.taxPct = taxPct
    }

    func calcTip(tipPct:Double) -> (tipAmount:Double, total:Double)
    {
        let tipAmount =  subtotal*tipPct
        let newTotal = subtotal+tipAmount
        return (tipAmount, newTotal)
    }
    func calcTipAmount(tipPct:Double) -> Double
    {
        return subtotal*tipPct
    }
    

    func printTips()
    {
        let possibleTips:[Double] = [0.15, 0.18, 0.20]
        for possibleTip in possibleTips {
            println("\(possibleTip*100)%: \(calcTip(possibleTip))")
        }

    }

    // note: [Int: Double] == Dictionary<Int, Double>
    func getTips() -> [Int: (Double, Double)] {
        let possibleTips:[Double] = [0.15, 0.18, 0.20]
        var retval = Dictionary<Int, (Double, Double)>()

        for possibleTip in possibleTips {
            let intPct = Int(possibleTip*100)
            retval[intPct] = calcTip(possibleTip)

        }
        return retval
    }
    
}
