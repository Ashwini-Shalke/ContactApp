//
//  ViewController.swift
//  ContactApplication
//
//  Created by Ashwini shalke on 22/09/19.
//  Copyright © 2019 Ashwini Shalke. All rights reserved.
//

import UIKit

class HomeScreen: UITableViewController {

    let cellID = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        self.navigationItem.title = "Contact"
       navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action:#selector(addTapped))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.lightGreen
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Groups", style: .plain, target: self, action: #selector(addTapped))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.lightGreen
        
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.navigationBar.barTintColor = UIColor.white
//    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = "test"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let CDScreen = ContactDetailScreen()
        navigationController?.pushViewController(CDScreen, animated: true)
    }
    
    @objc func addTapped()
    {
        
    }


}

