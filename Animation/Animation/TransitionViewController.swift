//
//  TransitionViewController.swift
//  Animation
//
//  Created by share2glory on 2018/7/3.
//  Copyright © 2018年 WH. All rights reserved.
//

import UIKit

class TransitionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private var animationView: UIView = {
        let view = UIView.init(frame: CGRect.init(x: 250, y: 200, width: 100, height: 100))
        view.backgroundColor = UIColor.red
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.init(x: 20, y: 64, width: 300, height: self.view.bounds.height-64))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    let titleArray = ["cube",
                      "moveIn",
                      "reveal",
                      "fade",
                      "pageCurl",
                      "pageUnCurl",
                      "suckEffect",
                      "rippleEffect",
                      "oglFlip",
                      "rotate",
                      "push",
                      "cameraIrisHollowOpen",
                      "cameraIrisHollowClose"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "CATransition"
        self.view.backgroundColor = UIColor.white
        
        
        self.view.addSubview(tableView)
        self.view.addSubview(animationView)
        
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = titleArray[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if let type = cell?.textLabel?.text {
            let animation = CATransition()
            animation.duration = 0.6
            animation.fillMode = kCAFillModeForwards
            animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
            animation.type = type
            if type != "rotate"{
                animation.subtype = kCATransitionFromLeft
            }else {
                animation.subtype = "90cw"
            }
            self.animationView.layer.add(animation, forKey: nil)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
