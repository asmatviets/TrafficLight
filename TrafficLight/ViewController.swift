//
//  ViewController.swift
//  TrafficLight
//
//  Created by Andrey Matviets on 19.03.2023.
//

import UIKit

final class ViewController: UIViewController { // set final, because we don't need inheritance
    
    @IBOutlet var redLight: UIView!
    @IBOutlet var yellowLight: UIView!
    @IBOutlet var greenLight: UIView!
    
    @IBOutlet var labelButton: UIButton!
    
    private var currentColorLight = Colours.red
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3

    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelButton.layer.cornerRadius = 10
        
        redLight.alpha = lightIsOff
        yellowLight.alpha = lightIsOff
        greenLight.alpha = lightIsOff

        print("Heigh at the moment of loading = \(redLight.frame.height)")
    }
    
    override func viewWillLayoutSubviews() {
        redLight.layer.cornerRadius = redLight.frame.width / 2
        yellowLight.layer.cornerRadius = yellowLight.frame.width / 2
        greenLight.layer.cornerRadius = greenLight.frame.width / 2
    }

    @IBAction func buttonAction() {
        if labelButton.currentTitle == "Start" {
            labelButton.setTitle("Next", for: .normal)
        }
        
        switch currentColorLight {
        case .red:
            greenLight.alpha = lightIsOff
            redLight.alpha = lightIsOn
            currentColorLight = .yellow
        case .yellow:
            redLight.alpha = lightIsOff
            yellowLight.alpha = lightIsOn
            currentColorLight = .green
        case .green:
            yellowLight.alpha = lightIsOff
            greenLight.alpha = lightIsOn
            currentColorLight = .red
        }
        print("Heigh at the moment button press = \(redLight.frame.height)")
    }
}

extension ViewController {
    private enum Colours {
        case red, yellow, green
    }
}
