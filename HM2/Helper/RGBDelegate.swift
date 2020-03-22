//
//  RGBDelegate.swift
//  HM2
//
//  Created by User on 22.03.2020.
//  Copyright © 2020 Oleksii ZHYHADLO. All rights reserved.
//

protocol RGBDelegate {
    var redColor: Float { get set }
    var greenColor: Float { get set}
    var blueColor: Float { get set }
    func changeColorView(red: Float, green: Float, blue: Float)
}
