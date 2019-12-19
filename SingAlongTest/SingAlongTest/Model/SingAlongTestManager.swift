//
//  SingAlongTestManager.swift
//  SingAlongTest
//
//  Created by Adnan Kallas on 2019-12-19.
//  Copyright © 2019 Adnan ALKallas. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
class SingAlongTestManager {
    
    static func fetchEventDetail(getProgramsUrl:String, completionHandler: @escaping (Album?, NSError?,Int?) -> ()) {
        struct HTTPBinResponse: Decodable { let result: Album? }
        AF.request(getProgramsUrl)
            .responseDecodable(of: Album.self ) { response in
                print(response)
                switch response.result {
                case .success(let value):
                 //   print (value)
                    completionHandler(value, nil, response.response?.statusCode)
                case .failure(let error):
                    completionHandler(nil, error as NSError, response.response?.statusCode)
                }
                
        }
    }
    
    public static func downloadImage(Url:String,completionHandler: @escaping (UIImage?, NSError?,Int?) -> ()) {
        AF.request(Url,method:.get).responseData {response in
            switch response.result {
            case .success(let value):
                let image = UIImage(data:  value )
                completionHandler(image!, nil, response.response?.statusCode)
            case .failure(let error):
                completionHandler(nil, error as NSError, response.response?.statusCode)
                print (error)
                
            }
        }
    }

    
}
