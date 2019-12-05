//
//  WebServices.swift
//  ContactApplication
//
//  Created by Ashwini shalke on 04/12/19.
//  Copyright © 2019 Ashwini Shalke. All rights reserved.
//

import Foundation
import UIKit

class WebServices: NSObject {
    let urlString = "https://gojek-contacts-app.herokuapp.com/"
    static let sharedInstance = WebServices()
    
    func fetchAllData(completion : @escaping(contactData?, Error?) -> ()){
        guard var url = URL(string: urlString) else {return}
        url.appendPathComponent("contacts.json")
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error {
                print("Data Load Error", err)
                completion(nil,err)
            }
            guard let data = data else {return}
            do {
                let contactArray =  try JSONDecoder().decode([contactData].self, from: data)
                for item in contactArray {
                    completion(item, nil)
                }
                
            }catch let jsonError{
                print("Server Error", jsonError)
            }
        }.resume()
        
    }
}
