//
//  ViewControllerThree.swift
//  TableViewDemo
//
//  Created by share2glory on 2018/6/26.
//  Copyright © 2018年 WH. All rights reserved.
//

import UIKit

class ViewControllerThree: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        return tableView
    }()
    private var cellItems = [CellData](){
        didSet{
            tableView.reloadData()
        }
    }
    private var sectionModels = [SectionModel]() {
        didSet{
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.title = "收起效果"
        if #available(iOS 11.0, *){
            self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentBehavior.never
        }else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        let topY = isIhponeX ? 76 : 64
        tableView.frame = CGRect.init(x: 0, y: CGFloat(topY), width: screenWidth, height: screenHeight - CGFloat(topY))
        self.view.addSubview(tableView)

        let headerView = HeaderView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: 150))
        tableView.tableHeaderView = headerView
        
        
        for i in 0..<10 {
            var cellModels = [String]()
            for j in 0..<8{
                cellModels.append("\(j)")
            }
            sectionModels.append(SectionModel.init("\(i)", isExpanded: true, cellModels: cellModels))
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: UITableViewDataSource
extension ViewControllerThree: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionModels.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionModels[section].isExpanded ? sectionModels[section].cellModels.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "第\(indexPath.section)列 第\(indexPath.row)行"
        return cell
    }
}

// MARK: UITableViewDelegate
extension ViewControllerThree: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select in : \(indexPath)")
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? TableViewHeaderView
        if headerView == nil {
            headerView = TableViewHeaderView.init(reuseIdentifier: "header")
        }
        headerView?.sectionModel = sectionModels[section]
        headerView?.expandBack = {
            (isExpanded: Bool) -> Void in
            self.sectionModels[section].isExpanded = isExpanded
            tableView.reloadData()

        }
        return headerView!
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
}
