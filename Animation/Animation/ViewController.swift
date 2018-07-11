//
//  ViewController.swift
//  Animation
//
//  Created by share2glory on 2018/7/3.
//  Copyright © 2018年 WH. All rights reserved.
//
/*
 
 CAAnimation{
    CAPropertyAnimation{
        CABasicAnimation{
            CASpringAnimation
        }
    CAKeyframeAnimation
 }
    CATransition
    CAAnimationGroup
 */
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let titleArray = ["CABasicAnimation","CASpringAnimation","CAKeyframeAnimation","CATransition","CAAnimationGroup"]
        
        for i in 0..<titleArray.count {
            let button = UIButton.init(frame: CGRect.init(x: 50, y: 100+CGFloat(i)*60, width: 200, height: 50))
            button.setTitle(titleArray[i], for: .normal)
            button.addTarget(self, action: #selector(blick(button:)), for: .touchUpInside)
            button.tag = 100 + i
            button.backgroundColor = UIColor.blue
            button.layer.cornerRadius = 12
            self.view.addSubview(button)
        }
        
    }
    
    @objc private func blick(button: UIButton){
        switch button.tag-100 {
        case 0:
            let vc = BasicAnimationViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 1:
            let vc = SpringAnimationViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 2:
            let vc = KeyframeAnimationViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 3:
            let vc = TransitionViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 4:
            let vc = AnimationGroupViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            break
        default:
            break
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

