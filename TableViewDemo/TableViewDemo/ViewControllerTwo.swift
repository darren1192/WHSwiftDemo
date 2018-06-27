//
//  ViewControllerTwo.swift
//  TableViewDemo
//
//  Created by share2glory on 2018/6/26.
//  Copyright © 2018年 WH. All rights reserved.
//

import UIKit

class ViewControllerTwo: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCellTwo.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        return tableView
    }()
    private var cellItems = [CellData](){
        didSet{
            tableView.reloadData()
        }
    }
    let names = ["Li Lei","Wang Mei","Xiao Yu","Zhang Hui"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "自定义cell"
        self.view.backgroundColor = UIColor.white
        
        tableView.frame = self.view.frame
        self.view.addSubview(tableView)
        
        for i in 0..<names.count {
            let item  = CellData.init(names[i], headImg: UIImage.init(named: "mine_d")!)
            cellItems.append(item)
        }
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCellTwo
        cell?.data = cellItems[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? TableViewCellTwo
        if let data = cell?.data {
            let title = "select name is:\(data.name)"
            self.showAlertWithMessage(title: title)
        }
    }
    
    func showAlertWithMessage(title: String){
        let alert = UIAlertController.init(title: title, message: nil, preferredStyle: UIAlertControllerStyle.alert)
        self.present(alert, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.presentedViewController?.dismiss(animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
