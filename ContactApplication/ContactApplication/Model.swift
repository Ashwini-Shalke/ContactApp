//
//  Model.swift
//  ContactApplication
//
//  Created by Ashwini shalke on 16/10/19.
//  Copyright © 2019 Ashwini Shalke. All rights reserved.
//

import Foundation
import UIKit

struct contactData:Decodable {
    let first_name:String
    let  last_name:String
    let profile_pic:String
    let favorite: Bool
    let id:Int
}


