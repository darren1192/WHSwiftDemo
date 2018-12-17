//
//  ScanViewController.swift
//  QRCode
//
//  Created by share2glory on 2018/7/11.
//  Copyright © 2018年 WH. All rights reserved.
//

import UIKit
import AVFoundation

class ScanViewController: UIViewController {

    private lazy var scanImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "scan")
        return imageView
    }()
    private lazy var lineImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "miao")
        return imageView
    }()
    
    private lazy var albumButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect.init(x: 0, y: 0, width: 40, height: 40)
        button.setTitle("相册", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(albumButtonEvent), for: .touchUpInside)
        return button
    }()
    
    private var scanSession: AVCaptureSession!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: albumButton)

        scanImageView.frame = CGRect.init(x: 0, y: 0, width: 200, height: 200)
        scanImageView.center = self.view.center
        self.view.addSubview(scanImageView)
        scanImageView.addSubview(lineImageView)
        lineImageView.frame = CGRect.init(x: 0, y: 0, width: 200, height: 1)
        
        setupScanSession()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startScan()
    }
    
    @objc private func albumButtonEvent(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .photoLibrary
            self.present(picker, animated: true, completion: nil)
        }else {
            print("读取相册失败")
        }
    }
    
    
    func startScan(){
        lineImageView.layer.add(scanAnimation(), forKey: "scan")
        guard let scanSession = scanSession else { return }
        if !scanSession.isRunning {
            scanSession.startRunning()
        }
    }
    
    func scanAnimation() -> CABasicAnimation {
        let startPotion = CGPoint.init(x: lineImageView.center.x, y: 1)
        let endPotion = CGPoint.init(x: lineImageView.center.x, y: scanImageView.bounds.height-1)
        let translation = CABasicAnimation.init(keyPath: "position")
        translation.timingFunction = CAMediaTimingFunction.init(name: CAMediaTimingFunctionName.easeInEaseOut)
        translation.fromValue = startPotion
        translation.toValue = endPotion
        translation.duration = 5
        translation.repeatCount = MAXFLOAT
        translation.autoreverses = true
        return translation
    }

    func setupScanSession(){
        do{
            let device = AVCaptureDevice.default(for: .video)
            let input = try AVCaptureDeviceInput(device: device!)
            let output = AVCaptureMetadataOutput()
            output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            
            let scanSession = AVCaptureSession()
            scanSession.canSetSessionPreset(AVCaptureSession.Preset.high)
            if scanSession.canAddInput(input){
                scanSession.addInput(input)
            }
            if scanSession.canAddOutput(output){
                scanSession.addOutput(output)
            }
            output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
            
            let scanPreviewLayer = AVCaptureVideoPreviewLayer.init(session: scanSession)
            scanPreviewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
            scanPreviewLayer.frame = self.view.layer.bounds
            self.view.layer.insertSublayer(scanPreviewLayer, at: 0)
            
            NotificationCenter.default.addObserver(forName: NSNotification.Name.AVCaptureInputPortFormatDescriptionDidChange, object: nil, queue: nil) { (notification) in
                output.rectOfInterest = (scanPreviewLayer.metadataOutputRectConverted(fromLayerRect: self.scanImageView.frame))
            }
            self.scanSession = scanSession
        }catch _ {
            return
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension ScanViewController: AVCaptureMetadataOutputObjectsDelegate{
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        var stringValue: String?

        if metadataObjects.count > 0 {
            let metadataObject = metadataObjects.first as? AVMetadataMachineReadableCodeObject
            stringValue = metadataObject?.stringValue
            if stringValue != nil {
                self.lineImageView.layer.removeAllAnimations()
                self.scanSession.stopRunning()
            }
        }
        self.lineImageView.layer.removeAllAnimations()
        self.scanSession.stopRunning()
        let alerController = UIAlertController.init(title: "二维码", message: stringValue, preferredStyle: .alert)
        let okAction = UIAlertAction.init(title: "确定", style: .default) { (action) in
            self.lineImageView.layer.add(self.scanAnimation(), forKey: "scan")
            self.scanSession.startRunning()
        }
        alerController.addAction(okAction)
        self.present(alerController, animated: true, completion: nil)
    }
}

extension ScanViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        let ciImage = CIImage.init(image: image)!
        let context = CIContext.init(options: nil)
        let detector = CIDetector.init(ofType: CIDetectorTypeQRCode, context: context, options: [CIDetectorAccuracy: CIDetectorAccuracyHigh])
        if let features = detector?.features(in: ciImage) {
            print("features.count:\(features.count)")
            var codeString = ""
            for feature in features as! [CIQRCodeFeature]{
                codeString += feature.messageString!
            }
            print("QRCode string :\(codeString)")
            picker.dismiss(animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //
    }
    
}
