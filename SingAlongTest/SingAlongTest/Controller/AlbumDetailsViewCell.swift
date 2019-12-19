//
//  AlbumDetailsViewCell.swift
//  SingAlongTest
//
//  Created by Adnan Kallas on 2019-12-19.
//  Copyright © 2019 Adnan ALKallas. All rights reserved.
//

import UIKit

class AlbumDetailsViewCell: UITableViewCell {

    @IBOutlet weak var songImageView: UIImageView!
    @IBOutlet weak var songTitleLabel: UILabel!
    
    
    func setSongCell(songImageUrl:String?, songName:String?) {
        if songImageUrl != "" {
            Utils.fetchAlbumImage(logoUrl: songImageUrl!, imageView: songImageView)
            
        }
        songTitleLabel.text = songName
        
    }

}
