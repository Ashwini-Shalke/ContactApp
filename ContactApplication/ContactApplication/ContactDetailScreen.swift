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
        view.backgroundColor = UIColor.white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.lightGreen
        autolayout()
        
    }
    
    let topViewContainer : UIView = {
        let topView = UIView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = UIColor.lightGray
   // topView.setBackgroundGradientColor(colorOne: UIColor.lightGreen, colorTwo: UIColor.white)
        return topView
    }()
    
    let placeHolderImageView : UIImageView = {
        let image = UIImage(named: "placeholder_photo")
        let placeholder = UIImageView()
        placeholder.image = image
        placeholder.clipsToBounds = true
        placeholder.round()
        placeholder.translatesAutoresizingMaskIntoConstraints = false
        return placeholder
    }()
    
    @objc func addTapped(){
        
    }
    
    
    let messageButton: UIButton = {
        let messageImage = UIImage(named: "message_button") as UIImage?
        let msgBtn = UIButton.init(type: .custom)
        msgBtn.setImage(messageImage, for: .normal)
        return msgBtn
    }()
    
    let callButton: UIButton = {
        let callImage = UIImage(named:"call_button") as UIImage?
        let callBtn = UIButton(type: .custom)
        callBtn.setImage(callImage, for: .normal)
        return callBtn
    }()
    
    let emailButton: UIButton = {
        let emailImage = UIImage(named:"email_button") as UIImage?
        let emailBtn = UIButton(type: .custom)
        emailBtn.setImage(emailImage, for: .normal)
        return emailBtn
    }()
    
    
    let homeFavouriteButton: UIButton = {
        let homeFavouriteImage = UIImage(named:"favourite_button") as UIImage?
        let homeFavouriteBtn = UIButton(type: .custom)
        homeFavouriteBtn.setImage(homeFavouriteImage, for: .normal)
        return homeFavouriteBtn
    }()
    
    let phonenumberContainer: UIView = {
        let phonenumberView = UIView()
        phonenumberView.backgroundColor = UIColor.blue
        phonenumberView.translatesAutoresizingMaskIntoConstraints = false
        
        return phonenumberView
    }()
    
    let phonenumberLabel: UILabel = {
        let phoneLabel = UILabel()
        phoneLabel.text = "mobile"
        phoneLabel.font = UIFont(name:"", size: <#T##CGFloat#>)
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        return phoneLabel
    }()
    
  
    
    
    func autolayout() {
        view.addSubview(topViewContainer)
//        layout for topViewContainer
        NSLayoutConstraint.activate([
            topViewContainer.leftAnchor.constraint(equalTo: view.leftAnchor),
            topViewContainer.rightAnchor.constraint(equalTo: view.rightAnchor),
            topViewContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topViewContainer.heightAnchor.constraint(equalToConstant: 335)
            ])
        
        
        topViewContainer.addSubview(placeHolderImageView)
//         layout for profileViewContainer
        NSLayoutConstraint.activate([
            placeHolderImageView.topAnchor.constraint(equalTo: topViewContainer.topAnchor, constant: 60),
            placeHolderImageView.centerXAnchor.constraint(equalTo: topViewContainer.centerXAnchor),
            placeHolderImageView.heightAnchor.constraint(equalToConstant: 120),
            placeHolderImageView.widthAnchor.constraint(equalToConstant: 120)
            ])

//        layout for bottom contol buttons
        controlButtonLayout()
        
        view.addSubview(phonenumberContainer)
//        layout for phonenumbercontainer
        NSLayoutConstraint.activate([
            phonenumberContainer.topAnchor.constraint(equalTo: topViewContainer.bottomAnchor),
            phonenumberContainer.leftAnchor.constraint(equalTo: view.leftAnchor),
            phonenumberContainer.rightAnchor.constraint(equalTo: view.rightAnchor),
            phonenumberContainer.heightAnchor.constraint(equalToConstant: 56)
            ])
        
        phonenumberContainer.addSubview(phonenumberLabel)
//        layout for phonenumberLabel
        NSLayoutConstraint.activate([
            phonenumberLabel.topAnchor.constraint(equalTo: phonenumberContainer.topAnchor, constant: 18),
            phonenumberLabel.leftAnchor.constraint(equalTo: phonenumberContainer.leftAnchor, constant: 22),
            phonenumberLabel.heightAnchor.constraint(equalToConstant: 19)
            ])

    }
    
    func controlButtonLayout() {
        let stackView = UIStackView(arrangedSubviews: [messageButton,callButton,emailButton,homeFavouriteButton])
        stackView.spacing = 39
        topViewContainer.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leftAnchor.constraint(equalTo: topViewContainer.leftAnchor, constant: 44).isActive = true
        stackView.rightAnchor.constraint(equalTo: topViewContainer.rightAnchor, constant: 44)
        stackView.topAnchor.constraint(equalTo: placeHolderImageView.bottomAnchor, constant: 56).isActive = true
        
    }
}



