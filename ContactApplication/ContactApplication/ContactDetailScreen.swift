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
        
        controlButtonLayout()
        Autolayout()
        
    }
    
    let topViewContainer : UIView = {
        let topView = UIView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = UIColor.gray
        return topView
    }()
    
    let profileViewContainer: UIView = {
        let profileView = UIImageView(image: #imageLiteral(resourceName: "placeholder_photo"))
        //let profileView = UIView()
        profileView.backgroundColor = UIColor.red
        profileView.translatesAutoresizingMaskIntoConstraints = false
        
        profileView.layer.cornerRadius = profileView.frame.size.width/2
        profileView.clipsToBounds = true

        profileView.layer.borderColor = UIColor.white.cgColor
        profileView.layer.borderWidth = 5.0
        return profileView
    }()
    
    @objc func addTapped(){
        
    }
    
    
    let messageButton: UIButton = {
        let messageImage = UIImage(named: "message_button") as UIImage?
        let message = UIButton(type: .system)
        message.setImage(messageImage, for: .normal)
        return message
    }()
    
    let emailButton: UIButton = {
       let emailImage = UIImage(named:"email_button") as UIImage?
       let email = UIButton(type: .system)
        email.setImage(emailImage, for: .normal)
        return email
    }()
    
    let callButton: UIButton = {
        let callImage = UIImage(named:"call_button") as UIImage?
        let call = UIButton(type: .system)
        call.setImage(callImage, for: .normal)
        return call
    }()
    
    let homeFavouriteButton: UIButton = {
        let homeFavouriteImage = UIImage(named:"home_favourite") as UIImage?
        let homeFavourite = UIButton(type: .system)
        homeFavourite.setImage(homeFavouriteImage, for: .normal)
        return homeFavourite
    }()
    
    
    func controlButtonLayout()
    {
        let stackView = UIStackView(arrangedSubviews: [messageButton,callButton,emailButton,homeFavouriteButton])
        stackView.spacing = 39
        topViewContainer.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leftAnchor.constraint(equalTo: topViewContainer.leftAnchor, constant: 45).isActive = true
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 260).isActive = true
        stackView.bottomAnchor.constraint(equalTo: topViewContainer.bottomAnchor, constant: -30).isActive = true
        
    }
    
    func Autolayout()
    {
        NSLayoutConstraint.activate([
            topViewContainer.widthAnchor.constraint(equalTo: view.widthAnchor),
            topViewContainer.heightAnchor.constraint(equalToConstant: 335)])
       
        topViewContainer.addSubview(profileViewContainer)
        profileViewContainer.leftAnchor.constraint(equalTo: topViewContainer.leftAnchor, constant: 127.0).isActive = true
        //profileViewContainer.rightAnchor.constraint(equalTo: topViewContainer.rightAnchor, constant: 127.0).isActive = true
        profileViewContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 84).isActive = true
        profileViewContainer.bottomAnchor.constraint(equalTo: topViewContainer.bottomAnchor, constant: -130).isActive = true
        
        
        
    }
    
    
}
