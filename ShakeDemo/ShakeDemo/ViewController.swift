//
//  ViewController.swift
//  ShakeDemo
//
//  Created by share2glory on 2018/6/26.
//  Copyright © 2018年 WH. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Shakeable {

    private lazy var shakeHorizontalBtn: UIButton = {
        let button = UIButton.init(type: .custom)
        button.backgroundColor = UIColor.gray
        button.setTitle("水平抖动", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(shakeHorizontalEevent(button:)), for: .touchUpInside)
        return button
    }()
    private lazy var shakeVerticalBtn: UIButton = {
        let button = UIButton.init(type: .custom)
        button.backgroundColor = UIColor.gray
        button.setTitle("垂直抖动", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(shakeVerticalEevent(button:)), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(shakeHorizontalBtn)
        shakeHorizontalBtn.frame = CGRect.init(x: 50, y: 100, width: 100, height: 30)
        
        self.view.addSubview(shakeVerticalBtn)
        shakeVerticalBtn.frame = CGRect.init(x: 50, y: 200, width: 80, height: 100)
        
    }
    
    @objc private func shakeHorizontalEevent(button: UIButton){
        
        button.shake(directyion: .horizontal, times: 5, interval: 0.1, detal: 2) {
            print("finish shake")
        }
 
    }
    @objc private func shakeVerticalEevent(button: UIButton){
        
        button.shake(directyion: .vertical, times: 5, interval: 0.1, detal: 2) {
            print("finish shake")
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

