//
//  HeaderView.swift
//  TableViewDemo
//
//  Created by share2glory on 2018/6/27.
//  Copyright © 2018年 WH. All rights reserved.
//

import UIKit

class HeaderView: UIView {

    private lazy var backView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let topColor = UIColor.yellow
        let bottomColor = UIColor.orange
        let gradientColors = [topColor.cgColor, bottomColor.cgColor]
        
        let gradientLocations: [NSNumber] = [0.0, 1.0]
        
        //创建CAGradientLayer对象并设置参数
        //可以绘制一个充满整个图层的颜色梯度(包括原型图层等图层)在一个背景颜色上
        let gradientLayer = CAGradientLayer()
        // 图层的颜色空间(阶梯显示时按照数组的顺序显示渐进色)
        gradientLayer.colors = gradientColors
        // 各个阶梯的区间百分比
        gradientLayer.locations = gradientLocations
        gradientLayer.frame = self.frame
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
