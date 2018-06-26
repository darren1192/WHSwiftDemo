//
//  ViewController.swift
//  MPMediaQueryDemo
//
//  Created by share2glory on 2018/6/25.
//  Copyright © 2018年 WH. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor.white
        let musicButton = UIButton.init(frame: CGRect.init(x: 200, y: 200, width: 100, height: 100))
        musicButton.center = self.view.center
        musicButton.setTitle("进入音乐", for: .normal)
        musicButton.setTitleColor(UIColor.black, for: .normal)
        musicButton.backgroundColor = UIColor.gray
        musicButton.addTarget(self, action: #selector(musicBlick), for: .touchUpInside)
        view.addSubview(musicButton)
    }
    
    @objc func musicBlick(){
        
        if #available(iOS 9.3, *){
            let status = MPMediaLibrary.authorizationStatus()
            if status == MPMediaLibraryAuthorizationStatus.authorized{
                let vc = MusicViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }else {
                MPMediaLibrary.requestAuthorization { (status) in
                    if status == MPMediaLibraryAuthorizationStatus.authorized {
                        let vc = MusicViewController()
                        self.navigationController?.pushViewController(vc, animated: true)
                    }else {
                        print("not permissions")
                        let url = URL.init(string: UIApplicationOpenSettingsURLString)
                        UIApplication.shared.openURL(url!)
                    }
                }
            }
        }else {
            let vc = MusicViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

