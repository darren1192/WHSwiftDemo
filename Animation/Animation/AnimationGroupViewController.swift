//
//  AnimationGroupViewController.swift
//  Animation
//
//  Created by share2glory on 2018/7/3.
//  Copyright © 2018年 WH. All rights reserved.
//



import UIKit

class AnimationGroupViewController: UIViewController {
    private var animationView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "CAAnimationGroup"
        self.view.backgroundColor = UIColor.white
        
        animationView = UIView.init(frame: CGRect.init(x: 150, y: 200, width: 80, height: 80))
        animationView.backgroundColor = UIColor.red
        self.view.addSubview(animationView)
        
    
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1.5) {
            let transition = CABasicAnimation.init(keyPath: "transform.translation.x")
            transition.toValue = 300
            
            let rotation = CABasicAnimation.init(keyPath: "transform.rotation")
            rotation.toValue = CGFloat.pi
            
            let scale = CABasicAnimation.init(keyPath: "transform.scale")
            scale.toValue = 0.1
            
            let group = CAAnimationGroup()
            group.duration = 2
            group.animations = [transition, rotation, scale]
            group.isRemovedOnCompletion = false
            group.fillMode = CAMediaTimingFillMode.forwards
            
            self.animationView.layer.add(group, forKey: nil)
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
