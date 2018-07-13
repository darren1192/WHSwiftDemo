//
//  QRCodeViewController.swift
//  QRCode
//
//  Created by share2glory on 2018/7/11.
//  Copyright © 2018年 WH. All rights reserved.
//

import UIKit

class QRCodeViewController: UIViewController {

    private lazy var qrImageView1: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.init(x: 80, y: 100, width: 200, height: 200))
        return imageView
    }()
    private lazy var qrImageView2: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.init(x: 80, y: 350, width: 200, height: 200))
        return imageView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(qrImageView1)
        self.view.addSubview(qrImageView2)
        qrImageView1.image = generateQRCode(string: "swift", imageName: "")
        qrImageView2.image = generateQRCode(string: "swift", imageName: "ins_vip")
    }
    
    private func generateQRCode(string: String, imageName: String?) -> UIImage?{
        let stringData = string.data(using: .utf8, allowLossyConversion: false)
        //创建二维码滤镜
        let filter = CIFilter.init(name: "CIQRCodeGenerator")
        filter?.setValue(stringData, forKey: "inputMessage")
        filter?.setValue("H", forKey: "inputCorrectionLevel")
        
        let ciImage = filter?.outputImage
        
        //创建黑白色滤镜
        let colorFilter = CIFilter.init(name: "CIFalseColor")!
        colorFilter.setDefaults()
        colorFilter.setValue(ciImage, forKey: "inputImage")
        //二维码颜色
        colorFilter.setValue(CIColor.init(red: 0, green: 0, blue: 0), forKey: "inputColor0")
        //背景颜色
        colorFilter.setValue(CIColor.init(red: 1, green: 1, blue: 1), forKey: "inputColor1")
        
        //返回二维码image
        let transform = CGAffineTransform.init(scaleX: 5, y: 5)
        let outputImage = colorFilter.outputImage!.transformed(by: transform)
        let codeImage = UIImage.init(ciImage: outputImage)
        if let iconImage = UIImage.init(named: imageName!){
            let rect = CGRect.init(x: 0, y: 0, width: codeImage.size.width, height: codeImage.size.height)
            UIGraphicsBeginImageContext(rect.size)
            codeImage.draw(in: rect)
            let avatarSize = CGSize.init(width: rect.size.width * 0.25, height: rect.size.height * 0.25)
            let x = (rect.width - avatarSize.width) * 0.5
            let y = (rect.height - avatarSize.height) * 0.5
            iconImage.draw(in: CGRect.init(x: x, y: y, width: avatarSize.width, height: avatarSize.height))
            //获取图片
            let resultImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return resultImage
        }
        return codeImage
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
