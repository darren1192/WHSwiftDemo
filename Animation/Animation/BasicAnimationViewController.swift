//
//  BasicAnimationViewController.swift
//  Animation
//
//  Created by share2glory on 2018/7/3.
//  Copyright © 2018年 WH. All rights reserved.
//

import UIKit

class BasicAnimationViewController: UIViewController,CAAnimationDelegate {

    private var animationView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "CABasicAnimation"
        self.view.backgroundColor = UIColor.white
        let titleArray = ["opacity","scale","rotation","position"]
        
        for i in 0..<titleArray.count {
            let button = UIButton.init(frame: CGRect.init(x: 50, y: 100+CGFloat(i)*60, width: 100, height: 50))
            button.setTitle(titleArray[i], for: .normal)
            button.addTarget(self, action: #selector(blick(button:)), for: .touchUpInside)
            button.tag = 200 + i
            button.backgroundColor = UIColor.orange
            self.view.addSubview(button)
        }
        
        animationView = UIView.init(frame: CGRect.init(x: 200, y: 200, width: 80, height: 80))
        animationView.backgroundColor = UIColor.red
        self.view.addSubview(animationView)
  
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    @objc private func blick(button: UIButton){
        var animation = CABasicAnimation()
        switch button.tag - 200 {
        case 0:
            animation = CABasicAnimation.init(keyPath: "opacity")
            animation.fromValue = 1.0
            animation.toValue = 0.1
        case 1:
            animation = CABasicAnimation.init(keyPath: "transform.scale")
            animation.fromValue = 1.0
            animation.toValue = 0.5
        case 2:
            animation = CABasicAnimation.init(keyPath: "transform.rotation")
            animation.toValue = CGFloat.pi
        case 3:
            animation = CABasicAnimation.init(keyPath: "position")
            animation.toValue = NSValue.init(cgPoint: CGPoint.init(x: self.animationView.center.x, y: self.animationView.center.y-100))
        default:
            break
        }
        animation.delegate = self
        animation.duration = 0.25
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction.init(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.autoreverses = true
        animation.fillMode = CAMediaTimingFillMode.both
        self.animationView.layer.add(animation, forKey: "baseanimation")
    }
    
    func animationDidStart(_ anim: CAAnimation) {
        print("animation start")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        print("animation stop")
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
