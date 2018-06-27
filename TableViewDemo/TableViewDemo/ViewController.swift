//
//  ViewController.swift
//  TableViewDemo
//
//  Created by share2glory on 2018/6/26.
//  Copyright © 2018年 WH. All rights reserved.
//

import UIKit

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height
let isIhponeX = (screenHeight == 812) ? true : false
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let titleArray = ["最简单的tableview","tableview 自定义cell","收起效果"]
        for i in 0..<titleArray.count {
            let button = UIButton.init(frame: CGRect.init(x: 50, y: 100+CGFloat(i)*50, width: screenWidth - 100, height: 40))
            button.backgroundColor = UIColor.gray
            button.setTitle(titleArray[i], for: .normal)
            button.setTitleColor(UIColor.black, for: .normal)
            button.tag = 100 + i
            button.addTarget(self, action: #selector(blick(button:)), for: .touchUpInside)
            self.view.addSubview(button)
        }
    }
    
    @objc private func blick(button: UIButton){
        let tag = button.tag
        switch tag - 100 {
        case 0:
            self.navigationController?.pushViewController(ViewControllerOne(), animated: true)
            break
        case 1:
            self.navigationController?.pushViewController(ViewControllerTwo(), animated: true)
            break
        case 2:
            self.navigationController?.pushViewController(ViewControllerThree(), animated: true)
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

