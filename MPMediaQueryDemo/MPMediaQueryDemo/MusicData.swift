
//
//  MusicData.swift
//  MPMediaQueryDemo
//
//  Created by share2glory on 2018/6/25.
//  Copyright © 2018年 WH. All rights reserved.
//

import Foundation
struct MusicData {
    var name: String
    var path: URL
    var artist: String
    var duration: TimeInterval

    init(_ name: String, path: URL, artist: String, duration: TimeInterval) {
        self.name = name
        self.path = path
        self.artist = artist
        self.duration = duration
    }
}
