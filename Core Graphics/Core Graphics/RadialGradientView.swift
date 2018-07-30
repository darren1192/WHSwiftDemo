//
//  RadialGradientView.swift
//  Core Graphics
//
//  Created by share2glory on 2018/7/30.
//  Copyright © 2018年 WH. All rights reserved.
//

import UIKit

class RadialGradientView: UIView {

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
       //渐变圆心位置
        let center = CGPoint.init(x: self.bounds.midX, y: self.bounds.midY)
        //外圆半径
        let endRadius = min(self.bounds.width, self.bounds.height)/2
        //内圆半径
        let startRadius = endRadius / 3
       
        //绘制渐变
        context.drawRadialGradient(gradient, startCenter: center, startRadius: startRadius, endCenter: center, endRadius: endRadius, options: .drawsBeforeStartLocation)
        
    }

}
