//
//  UIBezierPathExtensions.swift
//  GraphicsToolKit
//
//  Created by Andrew Chai on 5/12/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import CoreGraphics

extension UIBezierPath {
    /// Circumscribed Circle in Rect
    convenience init(circumscribedCircleRect rect: CGRect) {
        let halfWidth = rect.width / 2
        let halfHeight = rect.height / 2
        let radius = sqrt(halfWidth * halfWidth + halfHeight * halfHeight)
        let center = CGPoint(x: rect.midX, y: rect.midY)
        self.init(arcCenter: center, radius: radius, startAngle: CGFloat(0).radians(), endAngle: CGFloat(360).radians(), clockwise: true)
    }
    /// Inscribed Circle in Rect
    convenience init(inscribedCircleRect rect: CGRect) {
        let halfWidth = rect.width / 2
        let halfHeight = rect.height / 2
        let radius = halfWidth >= halfHeight ? halfHeight : halfWidth
        let center = CGPoint(x: rect.midX, y: rect.midY)
        self.init(arcCenter: center, radius: radius, startAngle: CGFloat(0).radians(), endAngle: CGFloat(360).radians(), clockwise: true)
    }
    /// Oval outside in Rect
    convenience init(ovalOutsideRect rect: CGRect) {
        let width = rect.width
        let height = rect.height
        let origin = CGPoint(x: rect.minX, y: rect.minY)
        let newSize = CGSize(width: CGFloat(2.squareRoot()) * width, height: CGFloat(2.squareRoot()) * height)
        let newRect = CGRect(x: origin.x + (width - newSize.width), y: origin.y + (height - newSize.height) / 2, width: newSize.width, height: newSize.height)
        self.init(ovalIn: newRect)
    }
    /// Left side Rect & right side curve & outside in Rect. Variations above.
    convenience init(ovalOutRectTextFlowRight rect: CGRect) {
        let width = rect.width
        let height = rect.height
        let origin = CGPoint(x: rect.minX, y: rect.minY)
        let newSize = CGSize(width: CGFloat(2.squareRoot()) * width, height: CGFloat(2.squareRoot()) * height)
        let newRect = CGRect(x: origin.x + (width - newSize.width) / 2, y: origin.y + (height - newSize.height) / 2, width: newSize.width, height: newSize.height)
        self.init(ovalIn: newRect)
        let bezSquare = UIBezierPath(rect: CGRect(x: newRect.minX, y: newRect.minY, width: newRect.width / 2, height: newRect.height))
        self.append(bezSquare)
    }
}
