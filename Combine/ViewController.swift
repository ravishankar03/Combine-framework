//
//  ViewController.swift
//  
//
//  Created by Ravi Shankar S. V. V on 28/05/20.
//  Copyright © 2020 ravi. All rights reserved.
//

import UIKit
import Combine

class ViewController: UIViewController  {

    @IBOutlet weak var sliderView: UISlider!
    
    @IBOutlet weak var sliderLabel: UILabel!
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var textContentField: UITextField!
    
    var viewModelCombine: LogicCombine!
    var cancelables: [AnyCancellable] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // we are create an instance

        viewModelCombine = LogicCombine()
       

        self.cancelables = [
            viewModelCombine.textlabelValue.assign(to: \.text, on: sliderLabel),
            viewModelCombine.textContentValue.assign(to: \.text, on: textContentField),
            viewModelCombine.buttonEnabled.assign(to: \.isEnabled, on: submitButton)
        ]
    }
    
    override func viewWillLayoutSubviews() {
        
        submitButton.layer.cornerRadius = 4.0
        sliderLabel.layer.cornerRadius = 4.0
        sliderLabel.clipsToBounds = true
    }

    @IBAction func sliderValueChanged() {
        
        viewModelCombine.currentSliderValue = Int(sliderView.value)
        
    }
    @IBAction func submitButtonTapped() {
        
        viewModelCombine.textContentValue.value =  textContentField.text ?? ""
       // viewModelCombine.startTimer()
        viewModelCombine.initiateContent()
        textContentField.text = ""
        sliderView.value = 0

    }
}



