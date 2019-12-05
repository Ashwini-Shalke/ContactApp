//
//  HomeContact.swift
//  ContactApplication
//
//  Created by Ashwini shalke on 04/12/19.
//  Copyright © 2019 Ashwini Shalke. All rights reserved.
//

import Foundation
import UIKit

class HomeContact : UIViewController {
    var arrMovieVM = [ContactViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllData()
    }
    
    func getAllData(){
        WebServices.sharedInstance.fetchAllData { (contact, error) in
//            if (error == nil){
//                guard let contact = contact else {return}
//                let contactData = ContactViewModel(contactArray: contact)
//                self.contactArr.append(contactData)
//
//            }
//            print(self.contactArr)
//
            self.arrMovieVM = contact.map({ return ContactViewModel(contactArray: $0)  })
        }
    }
}
