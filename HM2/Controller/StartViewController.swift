//
//  StartViewController.swift
//  HM2
//
//  Created by User on 22.03.2020.
//  Copyright © 2020 Oleksii ZHYHADLO. All rights reserved.
//

import UIKit

class StartViewController: UIViewController, RGBDelegate {
    
    var redColor: Float = 0.2
    var greenColor: Float = 0.5
    var blueColor: Float = 0.8
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "sliderView" { return }
        let vc = segue.destination as! ViewController
        
        vc.red = redColor
        vc.green = greenColor
        vc.blue = blueColor
        vc.delegate = self
    }

    func changeColorView(red: Float, green: Float, blue: Float) {
        
        redColor = red
        greenColor = green
        blueColor = blue
        
        view.backgroundColor = UIColor(
            red: CGFloat(red),
            green: CGFloat(green),
            blue: CGFloat(blue),
            alpha: 1
        )
      }
}
