//
//  TableViewCell.swift
//  CAGradientLayer
//
//  Created by share2glory on 2018/6/28.
//  Copyright © 2018年 WH. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    lazy var titleLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor.clear
        selectionStyle = .none
        
        titleLabel.frame = CGRect.init(x: 12, y: 3, width: 300, height: 20)
        titleLabel.font = UIFont.systemFont(ofSize: 12)
        titleLabel.textColor = UIColor.white
        titleLabel.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        titleLabel.layer.cornerRadius = 9
        titleLabel.layer.masksToBounds = true
        contentView.addSubview(titleLabel)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
