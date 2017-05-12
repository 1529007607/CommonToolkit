//
//  CGFloatExtensions.swift
//  GraphicsToolKit
//
//  Created by Andrew Chai on 5/12/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import CoreGraphics

extension CGFloat {
    func radians() -> CGFloat {
        let b = CGFloat(Double.pi) * (self / 180)
        return b
    }
}
