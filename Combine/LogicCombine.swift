//
//  LogicCombine.swift
//  upwork_Project
//
//  Created by Ravi Shankar S. V. V on 29/05/20.
//  Copyright © 2020 ravi. All rights reserved.
//

import Foundation
import Combine



class LogicCombine {

    
enum Action {
    case submitClicked
}
private var timer = Timer()
private var offset: TimeInterval = 0.0
private var initialTimer: Int = 0
    
var textlabelValue = CurrentValueSubject<String?, Never>(nil)

var textContentValue = CurrentValueSubject<String?, Never>(nil)
var buttonEnabled   = CurrentValueSubject<Bool, Never>(true)

var currentSliderValue: Int = 0
let action = PassthroughSubject<Action, Never>()


    func initiateContent() {
        
      let _ =  buttonEnabled.sink(receiveValue: {_ in
            self.startTimer()
        })
    }
    
    
    func startTimer() {
        initialTimer = self.currentSliderValue
        invalidateTimer()
        
        if initialTimer == 0 {
            invalidateTimer()
            textlabelValue.value = getStringContent()
            currentSliderValue = 0
        } else {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        }
    }
    
    @objc func update() {
        
        if initialTimer == 0 {
            invalidateTimer()
            textlabelValue.value = getStringContent()
            currentSliderValue = 0
        } else {
            textlabelValue.value = "\(initialTimer)"
            initialTimer = initialTimer - 1
        }
    }
    
    func getStringContent() -> String {
        
        var finalString: String = ""
        switch String(currentSliderValue) {
            
        case "0":
            finalString = "Zero"
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
        
        if let textContent = textContentValue.value {
        if Int(textContent) != nil {
            //integer
            finalString  =  String(currentSliderValue) + "_" + finalString
            
        } else if textContent.count > 0 {
            finalString = String(currentSliderValue) + "_" + textContent
        }
        }
        return finalString
    }
    
    func invalidateTimer() {
        
        timer.invalidate()
        
    }
    
    
    deinit {
        invalidateTimer()
    }
    
}
