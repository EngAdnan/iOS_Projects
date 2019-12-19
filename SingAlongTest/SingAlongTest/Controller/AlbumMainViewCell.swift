//
//  albumMainViewCell.swift
//  SingAlongTest
//
//  Created by Adnan Kallas on 2019-12-19.
//  Copyright © 2019 Adnan ALKallas. All rights reserved.
//

import UIKit

class AlbumMainViewCell: UITableViewCell {
    
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var albumTitleLabel: UILabel!
    

     func setMainCell(albumImageUrl:String?, albumName:String?) {
           if albumImageUrl != "" {
               Utils.fetchAlbumImage(logoUrl: albumImageUrl!, imageView: albumImageView)
               
           }
           albumTitleLabel.text = albumName
           
       }

}
