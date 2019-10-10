//
//  EditContactScreen.swift
//  ContactApplication
//
//  Created by Ashwini shalke on 10/10/19.
//  Copyright © 2019 Ashwini Shalke. All rights reserved.
//

import Foundation
import UIKit

class EditContactScreen: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor =  UIColor.white
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(backToContactDetailScreen))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain
            , target: self, action: #selector(addTapped))
        autolayout()
    }
    
    @objc func addTapped(){
        //need to implement
    }
    
    @objc func backToContactDetailScreen(){
        let CDScreen = ContactDetailScreen()
        navigationController?.pushViewController(CDScreen, animated: false)
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
    
    let firstNameContainer: UIView = {
        let firstNameView = UIView()
        //phonenumberView.backgroundColor = UIColor.lightGray
        firstNameView.translatesAutoresizingMaskIntoConstraints = false
        return firstNameView
    }()
    
    let firstNameLabel: UILabel = {
        let firstNameLabel = UILabel()
        firstNameLabel.text = "First Name"
        firstNameLabel.font = UIFont(name: Fonts.SFUITextRegular, size: 16)
        firstNameLabel.textColor = UIColor.gray
        firstNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return firstNameLabel
    }()
    
    let firstNameText: UITextField = {
        let firstNameText = UITextField ()
        // phoneText.backgroundColor = UIColor.green
        firstNameText.text = "Ashwini"
        firstNameText.font = UIFont(name: Fonts.SFUITextRegular, size: 16)
        firstNameText.isUserInteractionEnabled = false
        firstNameText.translatesAutoresizingMaskIntoConstraints = false
        return firstNameText
    }()
    
    let lastNameContainer: UIView = {
        let lastNameView = UIView()
        //phonenumberView.backgroundColor = UIColor.lightGray
        lastNameView.translatesAutoresizingMaskIntoConstraints = false
        return lastNameView
    }()
    
    let lastNameLabel: UILabel = {
        let lastNameLabel = UILabel()
        lastNameLabel.text = "Last Name"
        lastNameLabel.font = UIFont(name: Fonts.SFUITextRegular, size: 16)
        lastNameLabel.textColor = UIColor.gray
        lastNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return lastNameLabel
    }()
    
    let lastNameText: UITextField = {
        let lastNameText = UITextField ()
        // phoneText.backgroundColor = UIColor.green
        lastNameText.text = "Shalke"
        lastNameText.font = UIFont(name: Fonts.SFUITextRegular, size: 16)
        lastNameText.isUserInteractionEnabled = false
        lastNameText.translatesAutoresizingMaskIntoConstraints = false
        return lastNameText
    }()
    

    
    
    func autolayout() {
        view.addSubview(topViewContainer)
        //        layout for topViewContainer
        NSLayoutConstraint.activate([
            topViewContainer.leftAnchor.constraint(equalTo: view.leftAnchor),
            topViewContainer.rightAnchor.constraint(equalTo: view.rightAnchor),
            topViewContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topViewContainer.heightAnchor.constraint(equalToConstant: 185)
            ])
        
        topViewContainer.addSubview(placeHolderImageView)
        //        layout for profileViewContainer
        NSLayoutConstraint.activate([
            placeHolderImageView.topAnchor.constraint(equalTo: topViewContainer.topAnchor, constant: 19),
            placeHolderImageView.centerXAnchor.constraint(equalTo: topViewContainer.centerXAnchor),
                        placeHolderImageView.bottomAnchor.constraint(equalTo: topViewContainer.bottomAnchor, constant: -18),
            placeHolderImageView.widthAnchor.constraint(equalToConstant: 160)
            ])
        
        view.addSubview(firstNameContainer)
        //        layout for phonenumbercontainer
        NSLayoutConstraint.activate([
            firstNameContainer.topAnchor.constraint(equalTo: topViewContainer.bottomAnchor),
            firstNameContainer.leftAnchor.constraint(equalTo: view.leftAnchor),
            firstNameContainer.rightAnchor.constraint(equalTo: view.rightAnchor),
            firstNameContainer.heightAnchor.constraint(equalToConstant: 56)
            ])
        
        firstNameContainer.addSubview(firstNameLabel)
        //        layout for phonenumberLabel
        NSLayoutConstraint.activate([
            firstNameLabel.topAnchor.constraint(equalTo: firstNameContainer.topAnchor, constant: 18),
            firstNameLabel.leftAnchor.constraint(equalTo: firstNameContainer.leftAnchor, constant: 22),
            firstNameLabel.rightAnchor.constraint(equalTo: firstNameContainer.rightAnchor, constant: 308),
            firstNameLabel.heightAnchor.constraint(equalToConstant: 19)
            ])
        
        firstNameContainer.addSubview(firstNameText)
        //        layout for phonenumberText
        NSLayoutConstraint.activate([
            firstNameText.topAnchor.constraint(equalTo: firstNameContainer.topAnchor, constant: 18),
            firstNameText.heightAnchor.constraint(equalToConstant: 19),
            firstNameText.leftAnchor.constraint(equalTo: firstNameLabel.rightAnchor, constant: 21),
            firstNameText.rightAnchor.constraint(equalTo: firstNameContainer.rightAnchor, constant: -10)
            ])
        
        
        view.addSubview(lastNameContainer)
        //        layout for phonenumbercontainer
        NSLayoutConstraint.activate([
            lastNameContainer.topAnchor.constraint(equalTo: firstNameContainer.bottomAnchor),
            lastNameContainer.leftAnchor.constraint(equalTo: view.leftAnchor),
            lastNameContainer.rightAnchor.constraint(equalTo: view.rightAnchor),
            lastNameContainer.heightAnchor.constraint(equalToConstant: 56)
            ])
        
        firstNameContainer.addSubview(lastNameLabel)
        //        layout for phonenumberLabel
        NSLayoutConstraint.activate([
            lastNameLabel.topAnchor.constraint(equalTo: lastNameContainer.topAnchor, constant: 18),
            lastNameLabel.leftAnchor.constraint(equalTo: lastNameContainer.leftAnchor, constant: 22),
            lastNameLabel.rightAnchor.constraint(equalTo: lastNameContainer.rightAnchor, constant: 308),
            lastNameLabel.heightAnchor.constraint(equalToConstant: 19)
            ])
        
        firstNameContainer.addSubview(lastNameText)
        //        layout for phonenumberText
        NSLayoutConstraint.activate([
            lastNameText.topAnchor.constraint(equalTo: lastNameContainer.topAnchor, constant: 18),
            lastNameText.heightAnchor.constraint(equalToConstant: 19),
            lastNameText.leftAnchor.constraint(equalTo: lastNameContainer.leftAnchor, constant: 102),
            lastNameText.rightAnchor.constraint(equalTo: lastNameContainer.rightAnchor, constant: -10)
            ])
    }
    
    
}
