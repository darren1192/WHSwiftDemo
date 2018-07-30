//
//  LinearGradientView.swift
//  Core Graphics
//
//  Created by share2glory on 2018/7/30.
//  Copyright © 2018年 WH. All rights reserved.
//

import UIKit

class LinearGradientView: UIView {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let compoents: [CGFloat] = [0xfc/255, 0x68/255, 0x20/255, 1,
                                    0xfe/255, 0xd3/255, 0x2f/255, 1,
                                    0xb1/255, 0xfc/255, 0x33/255, 1]
        //每组颜色所在位置 0-1
        let locations: [CGFloat] = [0, 0.5, 1]
        // 生成渐变色
        let gradient = CGGradient.init(colorSpace: colorSpace, colorComponents: compoents, locations: locations, count: locations.count)!
        
        let start = CGPoint.init(x: self.bounds.minX, y: self.bounds.minY)
        let end = CGPoint.init(x: self.bounds.maxX, y: self.bounds.maxY)
        
        //绘制渐变
        context.drawLinearGradient(gradient, start: start, end: end, options: .drawsBeforeStartLocation)
    }

}
