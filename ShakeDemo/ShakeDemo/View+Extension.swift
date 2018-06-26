//
//  View+Extension.swift
//  ShakeDemo
//
//  Created by share2glory on 2018/6/26.
//  Copyright © 2018年 WH. All rights reserved.
//

import UIKit
import AudioToolbox

public enum ShakeDirection: Int{
    case horizontal
    case vertical
}
extension UIView {
    /**
     扩展UIView增加抖动方法
     @param direction：抖动方向（默认是水平方向）
     @param times：抖动次数（默认5次）
     @param interval：每次抖动时间（默认0.1秒）
     @param delta：抖动偏移量（默认2）
     @param completion：抖动动画结束后的回调
     */
    public func shake(directyion: ShakeDirection = .horizontal,times: Int = 2, interval: TimeInterval = 0.1, detal: CGFloat = 2,completion:(() -> Void)? = nil ){
        UIView.animate(withDuration: interval, animations: {
            switch directyion {
            case .horizontal: self.layer.setAffineTransform(CGAffineTransform.init(translationX: detal, y: 0))
                break
            case .vertical:
            self.layer.setAffineTransform(CGAffineTransform.init(translationX: 0, y: detal))
                break
            }
        }) { (complete) in
            if times == 0 {
                UIView.animate(withDuration: interval, animations: {
                    self.layer.setAffineTransform(CGAffineTransform.identity)
                }, completion: { (complete) in
                    completion?()
                })
            }else {
                AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
                self.shake(directyion: directyion, times: times - 1, interval: interval, detal: detal * -1, completion: completion)
            }
        }
    }
}
