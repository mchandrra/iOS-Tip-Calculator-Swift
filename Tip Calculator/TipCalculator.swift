//
//  TipCalculator.swift
//  Tip Calculator
//
//  Created by Sri Chandra Mallipeddi on 12/30/15.
//  Copyright © 2015 Sri Chandra Mallipeddi. All rights reserved.
//

import Foundation

class TipCalculator {
    var total: Double
    var taxPct: Double
    var subtotal: Double {
        get {
            return total / (taxPct + 1)
        }
    }
    
    init(total: Double, taxPct: Double) {
        self.total = total
        self.taxPct = taxPct
    }
    
    func calcTipWithTipPct(tipPct:Double) -> (tipAmt:Double, total:Double) {
        let tipAmt = subtotal * tipPct
        let finalTotal = total + tipAmt
        return (tipAmt, finalTotal)
    }
    
    func returnPossibleTips() -> [Int: (tipAmt:Double, total:Double)] {
        
        let possibleTipsInferred = [0.02, 0.10, 0.15, 0.18, 0.20]
        
        var retval = [Int: (tipAmt:Double, total:Double)]()
        for possibleTip in possibleTipsInferred {
            let intPct = Int(possibleTip*100)
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retval
        
    }
    
}

