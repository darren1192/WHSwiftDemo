//
//  SectionModel.swift
//  TableViewDemo
//
//  Created by share2glory on 2018/6/27.
//  Copyright © 2018年 WH. All rights reserved.
//

import Foundation
struct SectionModel {
    var title: String
    var isExpanded: Bool
    var cellModels: [String]
    
    init(_ title: String, isExpanded: Bool, cellModels: [String]) {
        self.title = title
        self.isExpanded = isExpanded
        self.cellModels = cellModels
    }
}
