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
        phonenumberView.translatesAutoresizingMaskIntoConstraints = false
        return phonenumberView
    }()
    
    let phonenumberLabel: UILabel = {
        let phoneLabel = UILabel()
        phoneLabel.text = "mobile"
        phoneLabel.font = UIFont(name:"SFUIText-Regular", size: 16)
        phoneLabel.textColor = UIColor.gray
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        return phoneLabel
    }()
    
    let phonenumberText: UITextField = {
        let phoneText = UITextField ()
       // phoneText.backgroundColor = UIColor.green
        phoneText.text = "919075721798"
        phoneText.font = UIFont(name: "SFUIText-Regular", size: 16)
        phoneText.isUserInteractionEnabled = false
        phoneText.translatesAutoresizingMaskIntoConstraints = false
        return phoneText
    }()
    
    let emailContainer: UIView = {
        let emaillView = UIView()
       // emaillView.backgroundColor = UIColor.red
        emaillView.translatesAutoresizingMaskIntoConstraints = false
        return emaillView
    }()
    
    let emailLabel: UILabel = {
        let email = UILabel()
        email.text = "email"
        email.font = UIFont(name:"SFUIText-Regular", size: 16)
        email.textColor = UIColor.gray
        email.translatesAutoresizingMaskIntoConstraints = false
        return email
    }()
    
    let emailText: UITextField = {
        let email = UITextField ()
        //email.backgroundColor = UIColor.blue
        email.text = "ashwinishalke050@gmail.com"
        email.font = UIFont(name: "SFUIText-Regular", size: 16)
        email.isUserInteractionEnabled = false
        email.translatesAutoresizingMaskIntoConstraints = false
        return email
        
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
        
        phonenumberContainer.addSubview(phonenumberText)
        //        layout for phonenumberText
        NSLayoutConstraint.activate([
            phonenumberText.topAnchor.constraint(equalTo: phonenumberContainer.topAnchor, constant: 18),
            phonenumberText.heightAnchor.constraint(equalToConstant: 19),
           // phonenumberText.widthAnchor.constraint(equalToConstant: 130),
            phonenumberText.leftAnchor.constraint(equalTo: phonenumberLabel.rightAnchor, constant: 35),
            ])
        
        view.addSubview(emailContainer)
//        layout for emailContainer
        NSLayoutConstraint.activate([
            emailContainer.topAnchor.constraint(equalTo: phonenumberContainer.bottomAnchor),
            emailContainer.leftAnchor.constraint(equalTo: view.leftAnchor),
            emailContainer.rightAnchor.constraint(equalTo: view.rightAnchor),
            emailContainer.heightAnchor.constraint(equalToConstant: 56)])
        
        
        emailContainer.addSubview(emailLabel)
//        layout for emailLabel
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: emailContainer.topAnchor, constant: 18),
            emailLabel.leftAnchor.constraint(equalTo: emailContainer.leftAnchor, constant: 22),
            emailLabel.heightAnchor.constraint(equalToConstant: 19)
            ])
        
        emailContainer.addSubview(emailText)
//        layout for emailText
       NSLayoutConstraint.activate([
       emailText.topAnchor.constraint(equalTo: emailContainer.topAnchor, constant: 18),
       emailText.heightAnchor.constraint(equalToConstant: 19),
       //emailText.widthAnchor.constraint(equalToConstant: 161),
       emailText.leftAnchor.constraint(equalTo: emailLabel.rightAnchor, constant: 32)
        ])
        
    }
    
    func controlButtonLayout() {
        let stackView = UIStackView(arrangedSubviews: [messageButton,callButton,emailButton,homeFavouriteButton])
        stackView.distribution = .fillEqually
        
        //stackView.spacing = 39
        topViewContainer.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: placeHolderImageView.bottomAnchor, constant: 56),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 45),
            stackView.bottomAnchor.constraint(equalTo: topViewContainer.bottomAnchor, constant: -30),
            stackView.centerXAnchor.constraint(equalTo: topViewContainer.centerXAnchor)
         
            ])
        
        
        
    }
}



