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
    var arrayContact = [contactData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        self.navigationItem.title = "Contact"
       navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action:#selector(moveToAddContactScreen))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.lightGreen
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Groups", style: .plain, target: self, action: #selector(addTapped))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.lightGreen
        
        //getData()
    }
    
    func getData(){
        print("Hello")
        guard  let url = URL(string: "​http://gojek-contacts-app.herokuapp.com/apipie/1.0/contacts.json") else {
            print ("URL doesnt work ")
            return }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            do {
                if err == nil {
                self.arrayContact = try JSONDecoder().decode([contactData].self, from: data)
                for mainArr in self.arrayContact {
                    print(mainArr.first_name)
                }
                
                } }
            catch{
                print("Unable to fetch Data")
            }
        }.resume()
        
    }
  
    @objc func addTapped(){
        
    }

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
    
    @objc func moveToAddContactScreen()
    {
        let addContact = AddContactScreen()
        navigationController?.pushViewController(addContact, animated: true)
        
    }


}

