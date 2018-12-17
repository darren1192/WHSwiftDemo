//
//  SpringAnimationViewController.swift
//  Animation
//
//  Created by share2glory on 2018/7/3.
//  Copyright © 2018年 WH. All rights reserved.
//

import UIKit

class SpringAnimationViewController: UIViewController {
    private var animationView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "CASpringAnimation"
        self.view.backgroundColor = UIColor.white
        
        let button = UIButton.init(frame: CGRect.init(x: 50, y: 150, width: 100, height: 50))
        button.setTitle("弹性动画", for: .normal)
        button.backgroundColor = UIColor.orange
        button.addTarget(self, action: #selector(blick), for: .touchUpInside)
        self.view.addSubview(button)
        
        animationView = UIView.init(frame: CGRect.init(x: 200, y: 200, width: 80, height: 80))
        animationView.backgroundColor = UIColor.red
        self.view.addSubview(animationView)
    }

    @objc private func blick(){
        let springAnimation = CASpringAnimation.init(keyPath: "position.y")
        springAnimation.damping = 5
        springAnimation.stiffness = 100
        springAnimation.mass = 1
        springAnimation.initialVelocity = 0
        springAnimation.duration = springAnimation.settlingDuration
        springAnimation.fromValue = self.animationView.center.y
        springAnimation.toValue = self.animationView.center.y + 100
        springAnimation.fillMode = CAMediaTimingFillMode.forwards
        self.animationView.layer.add(springAnimation, forKey: "spring")
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
