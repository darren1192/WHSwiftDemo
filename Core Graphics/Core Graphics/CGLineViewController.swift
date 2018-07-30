//
//  CGLineViewController.swift
//  Core Graphics
//
//  Created by share2glory on 2018/7/27.
//  Copyright © 2018年 WH. All rights reserved.
//

import UIKit


class CGLineViewController: UIViewController {

    @IBOutlet weak var showView: UIView!
    private var cgView: CGView!
    private var red: CGFloat = 0
    private var green: CGFloat = 0
    private var blue: CGFloat = 0
    private var dashGap: CGFloat = 0
    private var dashLenght: CGFloat = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        cgView = CGView.init(frame: CGRect.init(x: 0, y: 0, width: showView.bounds.width, height: showView.bounds.height))
        showView.addSubview(cgView)

    }

    
    @IBAction func widthEvent(_ sender: UISlider) {
        cgView.revise(width: CGFloat(sender.value), color: nil, lengths: nil)
    }
    @IBAction func redEvent(_ sender: UISlider) {
        red = CGFloat(sender.value)
        let color = selectColor(red: red, green: green, blue: blue)
        cgView.revise(width: nil, color: color, lengths: nil)
    }
    @IBAction func greentEvent(_ sender: UISlider) {
        green = CGFloat(sender.value)
        let color = selectColor(red: red, green: green, blue: blue)
        cgView.revise(width: nil, color: color, lengths: nil)
    }
    @IBAction func blueEvent(_ sender: UISlider) {
        blue = CGFloat(sender.value)
        let color = selectColor(red: red, green: green, blue: blue)
        cgView.revise(width: nil, color: color, lengths: nil)
    }
    
    @IBAction func dashGapEvent(_ sender: UISlider) {
        dashGap = CGFloat(sender.value)
        let lengths: [CGFloat] = [dashLenght, dashGap]
        cgView.revise(width: nil, color: nil, lengths: lengths)
    }
    
    @IBAction func dashLenghtEvent(_ sender: UISlider) {
        dashLenght = CGFloat(sender.value)
        let lengths: [CGFloat] = [dashLenght, dashGap]
        cgView.revise(width: nil, color: nil, lengths: lengths)
    }
    
    
    func selectColor(red: CGFloat,green: CGFloat, blue: CGFloat) -> UIColor{
        return UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: 1)
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
