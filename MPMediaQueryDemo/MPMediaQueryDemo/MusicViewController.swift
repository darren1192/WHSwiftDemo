//
//  MusicViewController.swift
//  MPMediaQueryDemo
//
//  Created by share2glory on 2018/6/25.
//  Copyright © 2018年 WH. All rights reserved.
//

import UIKit
import MediaPlayer

class MusicViewController: UIViewController {

    private lazy var musicTableView = UITableView()
    private var musicPlayer: AVQueuePlayer!
    private var musicItems = [MusicData](){
        didSet{
            musicTableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        
        setupUI()
        getItunesMusic()
    }

    private func setupUI(){
        musicTableView.frame = view.bounds
        musicTableView.delegate = self
        musicTableView.dataSource = self
        musicTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(musicTableView)
    }
    
    private func getItunesMusic(){
        //从ipod库中读出音乐文件
        
        let query = MPMediaQuery()
        let items = query.items
        for item in items! {
            let title = item.title!
            let path = item.assetURL
            let artist = item.artist!
            let duration = item.playbackDuration
            if path != nil {
                let musicData: MusicData = MusicData.init(title, path: path!, artist: artist, duration: duration)
                musicItems.append(musicData)
            }
        }

        print(musicItems.count)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension MusicViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = musicItems[indexPath.row].name
        cell?.textLabel?.textColor = UIColor.black
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if musicPlayer != nil {
            musicPlayer.removeAllItems()
            musicPlayer = nil
        }
        musicPlayer = AVQueuePlayer.init(url: musicItems[indexPath.row].path)
        musicPlayer.play()
    }
}
