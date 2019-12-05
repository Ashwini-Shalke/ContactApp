//
//  HomeContact.swift
//  ContactApplication
//
//  Created by Ashwini shalke on 04/12/19.
//  Copyright © 2019 Ashwini Shalke. All rights reserved.
//

import Foundation
import UIKit

class HomeContact : UITableViewController {
    var arrMovieVM = [ContactViewModel]()
    let cellID = "CellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: cellID)
        getAllData()
    }
    
    func getAllData(){
        WebServices.sharedInstance.fetchAllData { (contacts, Error) in
            if (Error == nil) {
                for item in contacts ?? [] {
                    self.arrMovieVM.append(ContactViewModel(contactArray: item))
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
}


extension HomeContact {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrMovieVM.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TableViewCell
        let contactIndex = arrMovieVM[indexPath.row]
        cell.textLabel?.text = contactIndex.first_name
        return cell
    }
    
    
}
