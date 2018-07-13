//
//  ScanViewController.swift
//  QRCode
//
//  Created by share2glory on 2018/7/11.
//  Copyright © 2018年 WH. All rights reserved.
//

import UIKit

class ScanViewController: UIViewController {

    private lazy var scanImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "sao")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
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
