//
//  Albums.swift
//  SingAlongTest
//
//  Created by Adnan Kallas on 2019-12-18.
//  Copyright © 2019 Adnan AlKallas. All rights reserved.
//

import Foundation
import UIKit

struct Album:Decodable {
    let id:Int
    let albumId:Int
    let title:String
    let url:String
    let thumbnailUrl:String
    
}

