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
        view.addSubview(topViewContainer)
        //topViewContainer.setBackgroundGradientColor(colorOne: UIColor.green, colorTwo: UIColor.blue  )
        controlButtonLayout()
        autolayout()
        
    }
    
    let topViewContainer : UIView = {
        let topView = UIView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.frame = CGRect(x: 0, y: 0, width: 375.0, height: 334.0)
        topView.setBackgroundGradientColor(colorOne: UIColor.lightGreen, colorTwo: UIColor.white)
        return topView
    }()
    
    let placeHolderImageView : UIImageView = {
        let image = UIImage(named: "placeholder_photo")
        let placeholder = UIImageView(frame: CGRect(x: 0, y: 0, width: 120, height: 120))//DO not forcefully unwrap
        placeholder.image = image
        placeholder.clipsToBounds = true
        placeholder.layer.borderWidth = 3
        placeholder.layer.borderColor = UIColor.white.cgColor
        placeholder.backgroundColor = UIColor.red
        
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
    
    let emailButton: UIButton = {
        let emailImage = UIImage(named:"email_button") as UIImage?
        let emailBtn = UIButton(type: .custom)
        emailBtn.setImage(emailImage, for: .normal)
        return emailBtn
    }()
    
    let callButton: UIButton = {
        let callImage = UIImage(named:"call_button") as UIImage?
        let callBtn = UIButton(type: .custom)
        callBtn.setImage(callImage, for: .normal)
        return callBtn
    }()
    
    let homeFavouriteButton: UIButton = {
        let homeFavouriteImage = UIImage(named:"favourite_button") as UIImage?
        let homeFavouriteBtn = UIButton(type: .custom)
        homeFavouriteBtn.setImage(homeFavouriteImage, for: .normal)
        return homeFavouriteBtn
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
    
    func autolayout()
    {
        // layout for topViewContainer
        NSLayoutConstraint.activate([
            topViewContainer.widthAnchor.constraint(equalTo: view.widthAnchor),
            topViewContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topViewContainer.heightAnchor.constraint(equalToConstant: 335)])
        
        
        
        topViewContainer.addSubview(placeHolderImageView)
        
        // layout for profileViewContainer
        NSLayoutConstraint.activate([
            placeHolderImageView.topAnchor.constraint(equalTo: topViewContainer.topAnchor, constant: 60),
            placeHolderImageView.centerXAnchor.constraint(equalTo: topViewContainer.centerXAnchor),
            placeHolderImageView.heightAnchor.constraint(equalToConstant: 120),
            placeHolderImageView.widthAnchor.constraint(equalToConstant: 120)
            ])
        
        
        
    }
}



