//
//  FloatExtension.swift
//  HM2
//
//  Created by User on 22.03.2020.
//  Copyright © 2020 Oleksii ZHYHADLO. All rights reserved.
//

extension Float {
    func format(countAfterDot: Int) -> Float{
        let cast = String(format: "%.\(countAfterDot)f", self)
        return Float(cast) ?? 0.0
    }
}
