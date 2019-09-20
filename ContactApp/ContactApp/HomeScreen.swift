//
//  TableViewControler.swift
//  ContactApp
//
//  Created by Ashwini shalke on 17/09/19.
//  Copyright © 2019 Ashwini Shalke. All rights reserved.
//

import Foundation
import UIKit

class HomeScreen: UITableViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        view.addSubview(clickButton)
        clickButtonLayout()
        clickButton.addTarget(self, action: #selector(moveToNextScreen), for: .allTouchEvents)
        
    }
    
    let clickButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("ClickButton", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    @objc func moveToNextScreen() {
    let contactDetailScreen = ContactDetailScreen()
        self.navigationController?.pushViewController(contactDetailScreen, animated: true)
    }
    
    func clickButtonLayout() {
    NSLayoutConstraint.activate([
    clickButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    clickButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
    clickButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
    clickButton.heightAnchor.constraint(equalToConstant: 50)])
}

}
