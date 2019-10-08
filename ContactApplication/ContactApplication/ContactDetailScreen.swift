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
        navigationController?.navigationBar.tintColor = UIColor.lightGreen
        navigationController?.navigationBar.barTintColor = UIColor.customBlue
        navigationController?.navigationBar.shadowImage = UIImage()
        autolayout()
        
    }
    
    let topViewContainer : UIView = {
        let topView = UIView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = UIColor.customBlue
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
    
    let placeHolderLabel: UILabel = {
        let placeholder = UILabel()
        placeholder.text = "Ashwini Shalke"
        placeholder.adjustsFontSizeToFitWidth = true
        placeholder.textAlignment = NSTextAlignment.left
        placeholder.translatesAutoresizingMaskIntoConstraints = false
        placeholder.font = UIFont(name: "SFUIText-Bold", size: 19)
        //placeholder.font = UIFont.boldSystemFont(ofSize: 19)
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
    
    let messagLabel: UILabel = {
        let msgLabel = UILabel()
        msgLabel.text = "message"
        msgLabel.font = UIFont(name: "SFUIText-Regular", size: 12)
        return msgLabel
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
        //phonenumberView.backgroundColor = UIColor.lightGray
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
        phoneText.text = "919075721798919075721798919075721798919075721798919075721798"
        phoneText.font = UIFont(name: "SFUIText-Regular", size: 16)
        phoneText.isUserInteractionEnabled = false
        phoneText.translatesAutoresizingMaskIntoConstraints = false
        return phoneText
    }()
    
    let emailContainer: UIView = {
        let emailView = UIView()
        emailView.layer.borderWidth = 0.4
        emailView.layer.borderColor = UIColor.gray.cgColor
        emailView.translatesAutoresizingMaskIntoConstraints = false
        return emailView
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
        email.text = "ashwinishalke050@gmail.comashwinishalke050@gmail.comashwinishalke050@gmail.com"
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
            topViewContainer.heightAnchor.constraint(equalToConstant: 269)
            ])
        
        
        topViewContainer.addSubview(placeHolderImageView)
//        layout for profileViewContainer
        NSLayoutConstraint.activate([
            placeHolderImageView.topAnchor.constraint(equalTo: topViewContainer.topAnchor, constant: 19),
            placeHolderImageView.centerXAnchor.constraint(equalTo: topViewContainer.centerXAnchor),
            placeHolderImageView.heightAnchor.constraint(equalToConstant: 120),
            placeHolderImageView.widthAnchor.constraint(equalToConstant: 120)
            ])
        
        topViewContainer.addSubview(placeHolderLabel)
//        layout for placeHolderLabel
        NSLayoutConstraint.activate([
            placeHolderLabel.topAnchor.constraint(equalTo: placeHolderImageView.bottomAnchor, constant: 8),
            placeHolderLabel.centerXAnchor.constraint(equalTo: topViewContainer.centerXAnchor),
            placeHolderLabel.heightAnchor.constraint(equalToConstant: 24)
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
            phonenumberLabel.rightAnchor.constraint(equalTo: phonenumberContainer.rightAnchor, constant: 308),
            phonenumberLabel.heightAnchor.constraint(equalToConstant: 19)
            ])
        
        phonenumberContainer.addSubview(phonenumberText)
        //        layout for phonenumberText
        NSLayoutConstraint.activate([
            phonenumberText.topAnchor.constraint(equalTo: phonenumberContainer.topAnchor, constant: 18),
            phonenumberText.heightAnchor.constraint(equalToConstant: 19),
            phonenumberText.leftAnchor.constraint(equalTo: phonenumberContainer.leftAnchor, constant: 102),
            phonenumberText.rightAnchor.constraint(equalTo: phonenumberContainer.rightAnchor, constant: -10)
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
            emailLabel.rightAnchor.constraint(equalTo: emailContainer.rightAnchor, constant: 307),
            emailLabel.heightAnchor.constraint(equalToConstant: 19)
            ])
        
        emailContainer.addSubview(emailText)
        //         layout for emailText
        NSLayoutConstraint.activate([
            emailText.topAnchor.constraint(equalTo: emailContainer.topAnchor, constant: 18),
            emailText.heightAnchor.constraint(equalToConstant: 19),
            emailText.leftAnchor.constraint(equalTo: emailContainer.leftAnchor, constant: 102),
            emailText.rightAnchor.constraint(equalTo: emailContainer.rightAnchor, constant: -10)
            ])
        
    }
    
    func controlButtonLayout() {
        let stackView = UIStackView(arrangedSubviews: [messageButton,callButton,emailButton,homeFavouriteButton])
        stackView.distribution = .fillEqually
        topViewContainer.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: placeHolderLabel.bottomAnchor, constant: 24),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 45),
            stackView.bottomAnchor.constraint(equalTo: topViewContainer.bottomAnchor, constant: -30),
            stackView.centerXAnchor.constraint(equalTo: topViewContainer.centerXAnchor)
            ])
        
        
        
    }
}



