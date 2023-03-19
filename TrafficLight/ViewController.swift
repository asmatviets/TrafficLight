//
//  ViewController.swift
//  TrafficLight
//
//  Created by Andrey Matviets on 19.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var redLight: UIView!
    @IBOutlet var yellowLight: UIView!
    @IBOutlet var greenLight: UIView!
    @IBOutlet var labelButton: UIButton!
    
    enum Colors {
        case red, yellow, green
    }
    
    private var currentColorLight = Colors.red

    override func viewDidLoad() {
        super.viewDidLoad()
        changeStyle()
    }

    @IBAction func buttonAction() {
        labelButton.setTitle("Next", for: .normal)
        
        switch currentColorLight {
        case .red:
            turnOnLights()
            currentColorLight = .yellow
        case .yellow:
            turnOnLights()
            currentColorLight = .green
        case .green:
            turnOnLights()
            currentColorLight = .red
        }
    }
    
    private func changeStyle() {
        redLight.alpha = 0.3
        yellowLight.alpha = 0.3
        greenLight.alpha = 0.3
        
        redLight.layer.cornerRadius = 50
        yellowLight.layer.cornerRadius = 50
        greenLight.layer.cornerRadius = 50
        
        labelButton.layer.cornerRadius = 10
        
        currentColorLight = .red
    }
    
    private func turnOnLights() {
        switch currentColorLight {
        case .red:
            redLight.alpha = 1
            yellowLight.alpha = 0.3
            greenLight.alpha = 0.3
        case .yellow:
            redLight.alpha = 0.3
            yellowLight.alpha = 1
            greenLight.alpha = 0.3
        case .green:
            redLight.alpha = 0.3
            yellowLight.alpha = 0.3
            greenLight.alpha = 1
        }
    }
}

