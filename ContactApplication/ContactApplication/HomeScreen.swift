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
    var contactDictonary = [String: [String]]()
    var contactSectionTitle = [String]()
    
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
    
    @objc func moveToAddContactScreen() {
        let addContact = AddContactScreen()
        navigationController?.pushViewController(addContact, animated: true)
    }
    
    @objc func addTapped(){
        
    }
    
    func getData(){
        let jsonURLString = "https://gojek-contacts-app.herokuapp.com/contacts.json"
        guard let url = URL(string: jsonURLString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            do {
                self.arrayContact = try JSONDecoder().decode([contactData].self, from: data)
               
                // creating a dictonary for indexing
                for item in self.arrayContact {
                    let key = String(item.last_name.prefix(1)).uppercased()
                    if var contactValues = self.contactDictonary[key] {
                        contactValues.append(item.first_name + " " + item.last_name)
                        self.contactDictonary[key] = contactValues
                    }else {
                        self.contactDictonary[key] = [item.first_name + " " + item.last_name] }
                }
                self.contactSectionTitle = [String](self.contactDictonary.keys)
                self.contactSectionTitle = self.contactSectionTitle.sorted(by : {$0 < $1 })
                DispatchQueue.main.async { self.tableView.reloadData() }
            } catch let jsonErr{
                print("Unable to fetch Data",jsonErr)
            }
            }.resume()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return contactSectionTitle.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return contactSectionTitle[section]
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
       return self.contactSectionTitle
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = contactSectionTitle[section]
        if let contactCount = contactDictonary[key] {
            return contactCount.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        let key = contactSectionTitle[indexPath.section]
        if let contactName = contactDictonary[key] {
            cell.textLabel?.text = contactName[indexPath.row] }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let CDScreen = ContactDetailScreen()
        navigationController?.pushViewController(CDScreen, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }

}

