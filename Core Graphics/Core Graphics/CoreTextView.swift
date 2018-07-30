//
//  CoreTextView.swift
//  Core Graphics
//
//  Created by share2glory on 2018/7/30.
//  Copyright © 2018年 WH. All rights reserved.
//

import UIKit

class CoreTextView: UIView {


    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        context.saveGState()
        
        //coretext坐标原点在左下角，转换
        context.textMatrix = CGAffineTransform.identity
        context.translateBy(x: 0, y: self.bounds.height)
        context.scaleBy(x: 1, y: -1)
        
        let path = CGMutablePath()
        path.addEllipse(in: self.bounds.insetBy(dx: 1, dy: 1))
        context.addPath(path)
        context.strokePath()

        let string = "test test test test test test test test test test test"
        let attrString = NSAttributedString.init(string: string)
        let frameSetter = CTFramesetterCreateWithAttributedString(attrString)
        let frame = CTFramesetterCreateFrame(frameSetter, CFRange.init(location: 0, length: attrString.length), path, nil)
        
        CTFrameDraw(frame, context)
        
        context.restoreGState()
        
        
    }
 

}
