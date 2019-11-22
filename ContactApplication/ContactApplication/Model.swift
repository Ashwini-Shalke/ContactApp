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
    var favorite: Bool
    let id:Int
}

struct contactDetail:Codable {
    let id:Int
    let first_name:String
    let last_name:String
    let email:String
    let phone_number:String
    let profile_pic:String
    let favorite:Bool
    let created_at:String
    let updated_at:String
}


