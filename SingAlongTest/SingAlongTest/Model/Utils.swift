//
//  Utils.swift
//  SingAlongTest
//
//  Created by Adnan Kallas on 2019-12-19.
//  Copyright © 2019 Adnan ALKallas. All rights reserved.
//

import Foundation
import UIKit
public class Utils {
    static let fetchAlbumsUrl = "https://jsonplaceholder.typicode.com/photos"
    
    public static func showAlertView(title:String, message:String, view: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Button", style: .default, handler: nil))
        view.present(alert, animated: true, completion: nil)
    }
    
    public static func fetchAlbumImage(logoUrl:String, programImageView:UIImageView){
        
        SingAlongTestManager.downloadImage(Url: logoUrl){  response, error, statusCode in
            programImageView.image = response!
            
        }
        
    }
    
    public static func setCellHeight(defaultHeight:Int) -> CGFloat {
        let screenDefaultHeight = CGFloat(UIScreen.main.bounds.size.height)
        let cellDefaultHeight =   CGFloat(defaultHeight)
        let rate:CGFloat = screenDefaultHeight / cellDefaultHeight
        let factor:CGFloat = ((UIScreen.main.bounds.size.height *  rate) / screenDefaultHeight )
        return (UIScreen.main.bounds.size.height / factor)
    }
}
