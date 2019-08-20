//
//  secondViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Phoenix McKnight on 8/19/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit
class SecondViewController: UIViewController {
    @IBOutlet weak var sizePreview: UILabel!
    @IBOutlet weak var test2: UILabel!
    @IBOutlet weak var sliderOutlet1: UISlider!
    @IBOutlet weak var stepperOutlet1: UIStepper!
    var delegate:ChangeFontSize?
    var currentValue:Float!
    
    var fontSizeValue:Float = 0.0

    
    @IBAction func slider1(_ sender: UISlider) {
        if delegate != nil{
            fontSizeValue = sender.value
            delegate?.changeFontSize(size: fontSizeValue)
            
            sizePreview.text = "Current Font Size: \(sender.value)"
           stepperOutlet1.value = Double(sender.value)
        }
        
    }
  

    @IBAction func stepper1(_ sender: UIStepper) {
        fontSizeValue = Float(sender.value)
        delegate?.changeFontSize(size: fontSizeValue)
        sliderOutlet1.value = Float(sender.value)
        stepperOutlet1.value = Double(sliderOutlet1.value)
        sizePreview.text = "Current Font Size: \(sender.value)"
    }

    
    override func viewDidLoad() {
        super .viewDidLoad()
       sliderOutlet1.value = currentValue ?? 20
        stepperOutlet1.value = Double(currentValue ?? 20)
        sizePreview.text = "Previous Font Size: \(String(describing: currentValue ?? 20))"
    }
    }

