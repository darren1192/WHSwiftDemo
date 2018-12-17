//
//  KeyframeAnimationViewController.swift
//  Animation
//
//  Created by share2glory on 2018/7/3.
//  Copyright © 2018年 WH. All rights reserved.
//

import UIKit

class KeyframeAnimationViewController: UIViewController {
    private var animationView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "CAKeyframeAnimation"
        self.view.backgroundColor = UIColor.white
        
        let titleArray = ["path椭圆","贝塞尔矩形","贝塞尔抛物线","贝塞尔s曲线","贝塞尔圆","弹力仿真","自晃动","指定点平移"]
        for i in 0..<titleArray.count {
            let button = UIButton.init(frame: CGRect.init(x: 10, y: 100+CGFloat(i)*60, width: 130, height: 50))
            button.setTitle(titleArray[i], for: .normal)
            button.addTarget(self, action: #selector(blick(button:)), for: .touchUpInside)
            button.tag = 300 + i
            button.backgroundColor = UIColor.orange
            self.view.addSubview(button)
        }
        
        animationView = UIView.init(frame: CGRect.init(x: 150, y: 200, width: 80, height: 80))
        animationView.backgroundColor = UIColor.red
        self.view.addSubview(animationView)
    }
    
    @objc private func blick(button: UIButton){
        let tag = button.tag - 300
        var animation = CAKeyframeAnimation.init(keyPath: "position")
        switch tag {
        case 0:
            let path = CGMutablePath()
            path.addEllipse(in: CGRect.init(x: 0, y: 0, width: 320, height: 500))
            animation.path = path
            animation.rotationMode = CAAnimationRotationMode.rotateAuto
        case 1:
            let path = UIBezierPath()
            path.move(to: self.animationView.center)
            path.addQuadCurve(to: CGPoint.init(x: 0, y: 500), controlPoint: CGPoint.init(x: 400, y: 100))
            animation.path = path.cgPath
        case 2:
            let path = UIBezierPath()
            path.move(to: .zero)
            path.addCurve(to: self.animationView.center, controlPoint1: CGPoint.init(x: 0, y: 500), controlPoint2: CGPoint.init(x: 400, y: 100))
            animation.path = path.cgPath
        case 3:
            let path = UIBezierPath()
            path.move(to: .zero)
            path.addCurve(to: self.animationView.center, controlPoint1: CGPoint.init(x: 320, y: 100), controlPoint2: CGPoint.init(x: 0, y: 400))
            animation.path = path.cgPath
        case 4:
            let path = UIBezierPath.init(arcCenter: self.view.center, radius: 150, startAngle: -CGFloat.pi*0.5, endAngle: CGFloat.pi*2, clockwise: true)
            animation.path = path.cgPath
        case 5:
            let point = CGPoint.init(x: self.view.center.x, y: 400)
            let xLength = point.x - self.animationView.center.x
            let yLength = point.y - self.animationView.center.y
            
            let path = CGMutablePath()
            path.move(to: CGPoint.init(x: self.animationView.center.x, y: self.animationView.center.y))
            path.addLine(to: CGPoint.init(x: point.x, y: point.y))
            var offsetDivider: CGFloat = 5.0
            while true {
                path.addLine(to: CGPoint.init(x: point.x + xLength / offsetDivider, y: point.y + yLength / offsetDivider))
                path.addLine(to: CGPoint.init(x: point.x, y: point.y))
                offsetDivider += 0.6
                if abs(xLength / offsetDivider) < 5.0 && abs(yLength / offsetDivider) < 5.0{
                    break
                }
            }
            animation.path = path
        case 6:
            animation = CAKeyframeAnimation.init(keyPath: "transform.rotation")
            let angle = CGFloat.pi/4 * 0.5
            let values = [angle, -angle, angle]
            animation.values = values
            animation.repeatCount = 4
            animation.duration = 0.5
        case 7:
            let p1 = NSValue.init(cgPoint: self.animationView.center)
            let p2 = NSValue.init(cgPoint: CGPoint.init(x: self.view.center.x + 100, y: 200))
            let p3 = NSValue.init(cgPoint: CGPoint.init(x: self.view.center.x, y: 300))
            animation.values = [p1, p2, p3]
            animation.duration = 0.5
        default:
            break
        }
        if tag < 6 {
            animation.duration = 0.5
            animation.isRemovedOnCompletion = false
            animation.fillMode = CAMediaTimingFillMode.both
            self.animationView.layer.add(animation, forKey: nil)
        }else {
            UIGraphicsBeginImageContext(self.view.frame.size)
            animation.timingFunction = CAMediaTimingFunction.init(name: CAMediaTimingFunctionName.easeInEaseOut)
            animation.isRemovedOnCompletion = false
            animation.fillMode = CAMediaTimingFillMode.both
            self.animationView.layer.add(animation, forKey: nil)
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
