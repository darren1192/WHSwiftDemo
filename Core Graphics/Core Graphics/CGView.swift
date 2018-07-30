//
//  CGView.swift
//  Core Graphics
//
//  Created by share2glory on 2018/7/27.
//  Copyright © 2018年 WH. All rights reserved.
//

import UIKit

class CGView: UIView {
    
    private var lineWidth: CGFloat = 5
    private var lineColor = UIColor.black
    private var lineCap: CGLineCap = .butt
    private var lineJion: CGLineJoin = .miter
    private var dashLengths: [CGFloat] = [0,0]

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        //获取上下文
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        //创建一个矩形，它的所有边都内缩3
        let drawRect = self.bounds.insetBy(dx: 0, dy: 0)
        //创建并设置路径
        let path = CGMutablePath()
        path.addRect(drawRect)
        //添加路径到上下文
        context.addPath(path)
        //设置颜色、宽度、端点样式、连接点样式、间隔
        context.setStrokeColor(lineColor.cgColor)
        context.setLineWidth(lineWidth)
        context.setLineCap(lineCap)
        context.setLineJoin(lineJion)
        context.setLineDash(phase: 0, lengths: dashLengths)
        //绘制路径
        context.strokePath()
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        CATransaction.commit()
    }
    public func revise(width: CGFloat?, color: UIColor?, lengths: [CGFloat]?){
        if width != nil {
            lineWidth = width!
        }
        if color != nil {
            lineColor = color!
        }
        if lengths != nil {
            dashLengths = lengths! 
        }
        self.setNeedsDisplay()
    }

    
}

