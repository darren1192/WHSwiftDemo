//
//  ViewControllerOne.swift
//  TableViewDemo
//
//  Created by share2glory on 2018/6/26.
//  Copyright © 2018年 WH. All rights reserved.
//

import UIKit

class Address: NSObject {
    var city: String = ""
    var provice: String = ""
}

class ViewControllerOne: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private lazy var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white

        self.title = "简单的tableView"
        
        tableView.frame = self.view.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)

    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "第" + "\(indexPath.row)" + "行" 
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
