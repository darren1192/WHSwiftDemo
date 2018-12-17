//
//  TableViewCellTwo.swift
//  TableViewDemo
//
//  Created by share2glory on 2018/6/26.
//  Copyright © 2018年 WH. All rights reserved.
//

import UIKit

class TableViewCellTwo: UITableViewCell {

    private lazy var headImgV = UIImageView()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        return label
    }()

    public var data: CellData! {
        didSet{
            headImgV.image = data.headImg
            titleLabel.text = data.name
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        headImgV.frame = CGRect.init(x: 12, y: 0, width: 30, height: 30)
        headImgV.center.y = self.center.y
        addSubview(headImgV)
        
        titleLabel.frame = CGRect.init(x: headImgV.frame.maxX+12, y: 0, width: 200, height: 20)
        titleLabel.center.y = self.center.y
        addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
