//
//  ContactViewModel.swift
//  ContactApplication
//
//  Created by Ashwini shalke on 04/12/19.
//  Copyright © 2019 Ashwini Shalke. All rights reserved.
//

import Foundation
import UIKit

class ContactViewModel: NSObject {
    let first_name:String?
    let  last_name:String?
    let profile_pic:String?
    var favorite: Bool?
    let id:Int?

    
    init(contactArray: contactData) {
        self.first_name = contactArray.first_name
        self.last_name = contactArray.last_name
        self.profile_pic = contactArray.profile_pic
        self.favorite = contactArray.favorite
        self.id = contactArray.id
    }
    

}
