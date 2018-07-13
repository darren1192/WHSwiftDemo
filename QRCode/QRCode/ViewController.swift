//
//  ViewController.swift
//  QRCode
//
//  Created by share2glory on 2018/7/11.
//  Copyright © 2018年 WH. All rights reserved.
//

import UIKit

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
 
    }
    @IBAction func qrCodeEvent(_ sender: UIButton) {
        self.navigationController?.pushViewController(QRCodeViewController(), animated: true)
    }
    
    @IBAction func scanEvent(_ sender: UIButton) {
        self.navigationController?.pushViewController(ScanViewController(), animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

