//
//  TableViewHeaderView.swift
//  TableViewDemo
//
//  Created by share2glory on 2018/6/27.
//  Copyright © 2018年 WH. All rights reserved.
//

import UIKit

typealias TableViewHeaderViewBack = (Bool) -> Void

class TableViewHeaderView: UITableViewHeaderFooterView {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        return label
    }()
    
    private lazy var acrossImageV: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    public var expandBack: TableViewHeaderViewBack?
    var sectionModel: SectionModel? {
        didSet{
            titleLabel.text = "第\(sectionModel!.title)组"
        }
    }
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addSubview(titleLabel)
        titleLabel.frame = CGRect.init(x: 20, y: 0, width: screenWidth-20, height: 44)
        
        let button = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: 44))
        button.addTarget(self, action: #selector(expandEvent), for: .touchUpInside)
        addSubview(button)
    }
    
    @objc private func expandEvent(){
        sectionModel?.isExpanded = !sectionModel!.isExpanded
        if self.expandBack != nil {
            expandBack!((sectionModel?.isExpanded)!)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
