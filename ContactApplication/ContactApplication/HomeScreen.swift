//
//  ViewController.swift
//  ContactApplication
//
//  Created by Ashwini shalke on 22/09/19.
//  Copyright © 2019 Ashwini Shalke. All rights reserved.
//

import UIKit

class HomeScreen: UITableViewController{
    
    let cellID = "cell"
    var arrayContact = [contactData]()
    let item = [String]()
    var dictonaryContact = [String: [String]]()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        self.navigationItem.title = "Contact"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action:#selector(moveToAddContactScreen))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.lightGreen
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Groups", style: .plain, target: self, action: #selector(addTapped))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.lightGreen
         getData()
    }
    
    func getData(){
        let jsonURLString = "https://gojek-contacts-app.herokuapp.com/contacts.json"
        guard let url = URL(string: jsonURLString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            do {
                self.arrayContact = try JSONDecoder().decode([contactData].self, from: data)
                
                for item in self.arrayContact {
                    let key = String(item.last_name.prefix(1))
                    if var contactValues = self.dictonaryContact[key] {
                       contactValues.append(item.last_name)
                        self.dictonaryContact[key] = contactValues
                    }
                    
                    
                }
                
                DispatchQueue.main.async { self.tableView.reloadData() }
            } catch let jsonErr{
                print("Unable to fetch Data",jsonErr)
            }
            }.resume()
        
    }
    
    @objc func addTapped(){
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayContact.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        //print(arrayContact[indexPath.row].first_name + " " + arrayContact[indexPath.row].last_name)
        cell.textLabel?.text = arrayContact[indexPath.row].first_name + " " + arrayContact[indexPath.row].last_name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let CDScreen = ContactDetailScreen()
        navigationController?.pushViewController(CDScreen, animated: true)
    }
    
    @objc func moveToAddContactScreen()
    {
        let addContact = AddContactScreen()
        navigationController?.pushViewController(addContact, animated: true)
        
    }
    
    
}

