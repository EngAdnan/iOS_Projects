//
//  Connectivity.swift
//  SingAlongTest
//
//  Created by Adnan Kallas on 2019-12-19.
//  Copyright © 2019 Adnan ALKallas. All rights reserved.
//

import Foundation
import Alamofire
class Connectivity {
    
    class var isConnectedToInternet:Bool {
           return NetworkReachabilityManager()!.isReachable
       }
    
}
