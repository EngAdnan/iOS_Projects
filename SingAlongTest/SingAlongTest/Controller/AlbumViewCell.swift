//
//  AlbumViewCell.swift
//  SingAlongTest
//
//  Created by Adnan Kallas on 2019-12-19.
//  Copyright © 2019 Adnan ALKallas. All rights reserved.
//

import UIKit

class AlbumViewCell: UICollectionViewCell {
    
    @IBOutlet weak var albumImageView: UIImageView!
    
    func setAlbumImage(albumLogoUrl:String?) {
        if albumLogoUrl != "" {
            Utils.fetchAlbumImage(logoUrl: albumLogoUrl!, imageView: albumImageView)
            
        }
        
    }
    
}
