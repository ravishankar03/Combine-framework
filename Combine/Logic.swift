//
//  Logic.swift
//  
//
//  Created by Ravi Shankar S. V. V on 28/05/20.
//  Copyright © 2020 ravi. All rights reserved.
//

import Foundation
import UIKit

protocol LogicDelegate: class {
    
    func updateText(time: Int)
}

class Logic {
    
    weak var delegate: LogicDelegate?
    
    private var timer = Timer()
    private var offset: TimeInterval = 0.0
    private var initialTimer: Int = 0
    var currentSliderValue: Int = 0
    var textContent: String = ""
    
    func invalidateTimer() {
        
        timer.invalidate()
    }
    
    @objc
    func update() {
        
        if initialTimer == 0 {
            invalidateTimer()
         //   currentSliderValue = 0
          //  textContent = ""
            delegate?.updateText(time: 0 )
        } else {
            delegate?.updateText(time: initialTimer )
            initialTimer = initialTimer - 1
        }
        
        
        
    }
    
    deinit {
        invalidateTimer()
    }
    
    func getStringContent() -> String {
       
        
        var finalString: String = ""
        switch String(currentSliderValue) {
        case "1":
            finalString = "One"
        case "2":
            finalString = "Two"
        case "3":
            finalString = "Three"
            case "4":
            finalString = "Four"
            case "5":
            finalString = "Five"
            case "6":
            finalString = "Six"
            case "7":
            finalString = "Seven"
            case "8":
            finalString = "Eight"
            case "9":
            finalString = "Nine"
        case "10":
            finalString = "Ten"
        default:
            break
            
    }
        
        if Int(textContent) != nil {
           //integer
         finalString  =  String(currentSliderValue) + "_" + finalString
            
        } else if textContent.count > 0 {
            finalString = String(currentSliderValue) + "_" + textContent
        }
        
        
        return finalString
    }
    
    func startTimer() {
        initialTimer = self.currentSliderValue
        invalidateTimer()
        
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        
    }
    
}
