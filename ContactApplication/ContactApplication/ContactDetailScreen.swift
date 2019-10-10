//
//  ContactDetailScreen.swift
//  ContactApplication
//
//  Created by Ashwini shalke on 22/09/19.
//  Copyright © 2019 Ashwini Shalke. All rights reserved.
//

import Foundation
import UIKit

struct Fonts {
    static let SFUITextBold = "SFUIText-Bold"
    static let SFUITextRegular = "SFUIText-Regular"
    
}

class ContactDetailScreen: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.tintColor = UIColor.lightGreen
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(pushToEditContactScreen))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.lightGreen
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Contact", style: .plain, target: self, action: #selector(backToHomeScreen))
        //navigationController?.navigationBar.barTintColor = UIColor.customBlue
        navigationController?.navigationBar.shadowImage = UIImage()
        autolayout()
    }
    
    @objc func pushToEditContactScreen(){
        let editContactScreen = EditContactScreen()
        navigationController?.pushViewController(editContactScreen, animated: false)
    }
    
    @objc func backToHomeScreen(){
        let homeScreen = HomeScreen()
        navigationController?.pushViewController(homeScreen, animated: true)
    }
    
    let topViewContainer : UIView = {
        let topView = UIView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = UIColor.customBlue
        //topView.setBackgroundGradientColor(colorOne: UIColor.lightGreen, colorTwo: UIColor.white)
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
        placeholder.font = UIFont(name: Fonts.SFUITextBold, size: 19)
        return placeholder
    }()
    
    let messageButton: UIButton = {
        let messageImage = UIImage(named: "message_button") as UIImage?
        let msgBtn = UIButton.init(type: .custom)
        msgBtn.setImage(messageImage, for: .normal)
        return msgBtn
    }()
    
    let messageButtonLabel: UILabel = {
        let msgBtnLabel = UILabel()
        msgBtnLabel.text = "message"
        //msgBtnLabel.font = UIFont(name: Fonts.SFUITextRegular, size: 0.5)
        msgBtnLabel.font = UIFont.systemFont(ofSize: 12)
        msgBtnLabel.translatesAutoresizingMaskIntoConstraints = false
        return msgBtnLabel
    }()
    
    let callButton: UIButton = {
        let callImage = UIImage(named:"call_button") as UIImage?
        let callBtn = UIButton(type: .custom)
        callBtn.setImage(callImage, for: .normal)
        return callBtn
    }()
    
    let callButtonLabel: UILabel = {
        let callBtnLabel = UILabel()
        callBtnLabel.text = "call"
        //msgBtnLabel.font = UIFont(name: Fonts.SFUITextRegular, size: 0.5)
        callBtnLabel.font = UIFont.systemFont(ofSize: 12)
        callBtnLabel.translatesAutoresizingMaskIntoConstraints = false
        return callBtnLabel
    }()
    
    let emailButton: UIButton = {
        let emailImage = UIImage(named:"email_button") as UIImage?
        let emailBtn = UIButton(type: .custom)
        emailBtn.setImage(emailImage, for: .normal)
        return emailBtn
    }()
    
    let emailButtonLabel: UILabel = {
        let emailBtnLabel = UILabel()
        emailBtnLabel.text = "email"
        //msgBtnLabel.font = UIFont(name: Fonts.SFUITextRegular, size: 0.5)
        emailBtnLabel.font = UIFont.systemFont(ofSize: 12)
        emailBtnLabel.translatesAutoresizingMaskIntoConstraints = false
        return emailBtnLabel
    }()
    
    let homeFavouriteButton: UIButton = {
        let homeFavouriteImage = UIImage(named:"favourite_button") as UIImage?
        let homeFavouriteBtn = UIButton(type: .custom)
        homeFavouriteBtn.setImage(homeFavouriteImage, for: .normal)
        return homeFavouriteBtn
    }()
    
    let favouriteButtonLabel: UILabel = {
        let favBtnLabel = UILabel()
        favBtnLabel.text = "favourite"
        //msgBtnLabel.font = UIFont(name: Fonts.SFUITextRegular, size: 0.5)
        favBtnLabel.font = UIFont.systemFont(ofSize: 12)
        favBtnLabel.translatesAutoresizingMaskIntoConstraints = false
        return favBtnLabel
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
        phoneLabel.font = UIFont(name: Fonts.SFUITextRegular, size: 16)
        phoneLabel.adjustsFontSizeToFitWidth = true
        phoneLabel.textColor = UIColor.gray
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        return phoneLabel
    }()
    
    let phonenumberText: UITextField = {
        let phoneText = UITextField ()
        // phoneText.backgroundColor = UIColor.green
        phoneText.text = "919075721798919075721798919075721798919075721798919075721798"
        phoneText.font = UIFont(name: Fonts.SFUITextRegular, size: 16)
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
        email.font = UIFont(name:Fonts.SFUITextRegular, size: 16)
        email.adjustsFontSizeToFitWidth = true
        email.textColor = UIColor.gray
        email.translatesAutoresizingMaskIntoConstraints = false
        return email
    }()
    
    let emailText: UITextField = {
        let email = UITextField ()
        email.text = "ashwinishalke050@gmail.comashwinishalke050@gmail.comashwinishalke050@gmail.com"
        email.font = UIFont(name: Fonts.SFUITextRegular, size: 16)
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
            phonenumberLabel.widthAnchor.constraint(equalToConstant: 48),
            phonenumberLabel.leftAnchor.constraint(equalTo: phonenumberContainer.leftAnchor, constant: 22),
            phonenumberLabel.heightAnchor.constraint(equalToConstant: 19)
            ])
        
        phonenumberContainer.addSubview(phonenumberText)
        //        layout for phonenumberText
        NSLayoutConstraint.activate([
            phonenumberText.topAnchor.constraint(equalTo: phonenumberContainer.topAnchor, constant: 18),
            phonenumberText.heightAnchor.constraint(equalToConstant: 19),
            phonenumberText.leftAnchor.constraint(equalTo: phonenumberLabel.rightAnchor, constant: 32),
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
            emailLabel.widthAnchor.constraint(equalToConstant: 38),
            emailLabel.heightAnchor.constraint(equalToConstant: 19)
            ])
        
        emailContainer.addSubview(emailText)
        //         layout for emailText
        NSLayoutConstraint.activate([
            emailText.topAnchor.constraint(equalTo: emailContainer.topAnchor, constant: 18),
            emailText.heightAnchor.constraint(equalToConstant: 19),
            emailText.leftAnchor.constraint(equalTo: emailLabel.rightAnchor, constant: 32),
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
        
        topViewContainer.addSubview(messageButtonLabel)
        //        layout for messageButtonLabel
        NSLayoutConstraint.activate([
            messageButtonLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 5),
            messageButtonLabel.centerXAnchor.constraint(equalTo: messageButton.centerXAnchor),
            messageButtonLabel.heightAnchor.constraint(equalToConstant: 14)
            ])
        
        topViewContainer.addSubview(callButtonLabel)
        //        layout for callButtonLabel
        NSLayoutConstraint.activate([
            callButtonLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 5),
            callButtonLabel.centerXAnchor.constraint(equalTo: callButton.centerXAnchor),
            callButtonLabel.heightAnchor.constraint(equalToConstant: 14)
            ])
        
        topViewContainer.addSubview(emailButtonLabel)
        //        layout for emailButtonLabel
        NSLayoutConstraint.activate([
            emailButtonLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 5),
            emailButtonLabel.centerXAnchor.constraint(equalTo: emailButton.centerXAnchor),
            emailButtonLabel.heightAnchor.constraint(equalToConstant: 14)
            ])
        
        topViewContainer.addSubview(favouriteButtonLabel)
        //        layout for favouriteButtonLabel
        NSLayoutConstraint.activate([
            favouriteButtonLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 5),
            favouriteButtonLabel.centerXAnchor.constraint(equalTo: homeFavouriteButton.centerXAnchor),
            favouriteButtonLabel.heightAnchor.constraint(equalToConstant: 14)
            ])
    }
}



