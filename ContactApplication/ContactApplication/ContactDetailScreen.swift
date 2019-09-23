//
//  ContactDetailScreen.swift
//  ContactApplication
//
//  Created by Ashwini shalke on 22/09/19.
//  Copyright © 2019 Ashwini Shalke. All rights reserved.
//

import Foundation
import UIKit

class ContactDetailScreen: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.green
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(addTapped))
        
        view.addSubview(topViewContainer)
        
    }
    
    let topViewContainer : UIView = {
        let topView = UIView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = UIColor.gray
        return topView
    }()
    
    @objc func addTapped(){
        
    }
    
    func Autolayout()
    {
        NSLayoutConstraint.activate([
            topViewContainer.widthAnchor.constraint(equalTo: view.widthAnchor),
            topViewContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)])
    }
    
}
