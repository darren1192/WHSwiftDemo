//
//  ViewController.swift
//  CAGradientLayer
//
//  Created by share2glory on 2018/6/28.
//  Copyright © 2018年 WH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        setupUIOne()
//        setupUITwo()
        setupUIThree()
    }
    
    func setupUIOne(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        self.view.layer.addSublayer(gradientLayer)
        
        gradientLayer.colors = [UIColor.red.cgColor,
                                UIColor.yellow.cgColor,
                                UIColor.orange.cgColor]
        let gradientLocations:[NSNumber] = [0.0,0.8,1.0]
        gradientLayer.locations = gradientLocations
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint.init(x: 1, y: 1)
    }
    
    func setupUITwo(){
        let containerView = UIView.init(frame: CGRect.init(x: 20, y: 100, width: 200, height: 60))
        self.view.addSubview(containerView)
        
        let label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 200, height: 60))
        label.text = "Darren wang"
        label.font = UIFont.boldSystemFont(ofSize: 26)
        containerView.addSubview(label)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.orange.cgColor, UIColor.yellow.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = label.frame
        containerView.layer.insertSublayer(gradientLayer, at: 0)
        gradientLayer.mask = label.layer
    }
    
    func setupUIThree(){
        let containerView = UIView.init(frame: CGRect.init(x: 0, y: 150, width: view.frame.size.width, height: view.frame.size.height-150))
        view.addSubview(containerView)
        
        let tableView = UITableView()
        tableView.frame = containerView.bounds
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.rowHeight = 30
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        containerView.addSubview(tableView)
        
         let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.black.withAlphaComponent(0.0).cgColor,
        UIColor.black.cgColor]
        gradientLayer.frame = containerView.frame
        gradientLayer.locations = [0,0.15,1]
        containerView.layer.mask = gradientLayer
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 60
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell
        if cell == nil {
            cell = TableViewCell.init(style: .default, reuseIdentifier: "cell")
        }
        cell?.titleLabel.text = "  第:\(indexPath.row)行"
        return cell!
    }
    
    
}
