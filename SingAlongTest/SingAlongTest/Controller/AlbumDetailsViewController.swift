//
//  AlbumDetailsViewController.swift
//  SingAlongTest
//
//  Created by Adnan Kallas on 2019-12-19.
//  Copyright © 2019 Adnan ALKallas. All rights reserved.
//

import UIKit
import ViewAnimator
class AlbumDetailsViewController: UITableViewController {
    var albumDetails:[Album]!
    var albumId:Int = 0
    private let animations = [AnimationType.from(direction: .left, offset: 20.0)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.clearsSelectionOnViewWillAppear = true
        tableView.tableFooterView = UIView()
        albumDetails =  albumDetails.filter { $0.self.albumId == albumId }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if albumDetails != nil {
            return albumDetails.count
        }
        return 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let albumImageUrl = albumDetails[indexPath.row].url
        let title = albumDetails[indexPath.row].title
        if indexPath.row == 0 {
            let mainCell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! AlbumMainViewCell
            mainCell.setMainCell(albumImageUrl: albumImageUrl, albumName: title)
            return mainCell
        }
        let songCell = tableView.dequeueReusableCell(withIdentifier: "detailsCell", for: indexPath) as! AlbumDetailsViewCell
        songCell.setSongCell(songImageUrl: albumImageUrl, songName: title)
        return songCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return CGFloat(CGFloat(UIScreen.main.bounds.size.width) * 0.55)
        }
        return CGFloat(CGFloat(UIScreen.main.bounds.size.width) * 0.25)
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.animate(animations: animations, duration: 1.5)

    }
    
}

