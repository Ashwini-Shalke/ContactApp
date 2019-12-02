//
//  EditContactScreen.swift
//  ContactApplication
//
//  Created by Ashwini shalke on 10/10/19.
//  Copyright © 2019 Ashwini Shalke. All rights reserved.
//

import Foundation
import UIKit

class EditContactScreen: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate,UITextFieldDelegate {
    
    var activeTextField = UITextField()
    var parentView = UIView()
    var contactId :Int?
    
    
    
    override func viewDidLoad() {
           super.viewDidLoad()
           view.backgroundColor =  UIColor.white
           navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(backToContactDetailScreen))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(loadData))
           autolayout()
           hideKeyboard()
           //loadData()
           NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
           NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
           
       }
    
    @objc func loadData() {
        print("Edit Screen")
        guard let contactID = contactId else {return}
        print(contactID)
        let id = String(describing: contactID)
        print("LoadData")
              
        let putURL = "http://gojek-contacts-app.herokuapp.com/contacts/14009.json"
        print("EditScreen ", id)
        guard let url = URL(string: putURL) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let parameters = ["first_name" : firstNameText.text, "last_name" : lastNameText.text , "email" : emailText.text , "phone_number" : mobileNumberText.text]
        
        guard let uploadData = try? JSONEncoder().encode(parameters) else {return}
        URLSession.shared.uploadTask(with: request, from: uploadData) { (data, response, err) in
            if let err = err {
                print("Error: ", err )
            }
            
            guard let response = response as? HTTPURLResponse,
                (200...299).contains(response.statusCode) else {
                    print(" Edit Screen Server Error")
                    return
            }
            
            if let mimeType = response.mimeType,
                mimeType == "application/json",
                let data = data,
                let dataString = String(data: data, encoding: .utf8) {
                print("Got data: ", dataString)
            }
            
        }.resume()
        navigationController?.popViewController(animated: true)
        
    }
    
    
    let topViewContainer : UIView = {
        let topView = UIView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = UIColor.customBlue
        return topView
    }()
    
    let placeHolderImageView : UIImageView = {
        let image = UIImage(named: "placeholder_photo")
        let placeholder = UIImageView()
        placeholder.image = image
        placeholder.frame = CGRect(x: 0, y: 0, width: 160, height: 0)
        placeholder.round()
        placeholder.clipsToBounds = true
        placeholder.layer.borderColor = UIColor.white.cgColor
        placeholder.layer.borderWidth = 3.0
        placeholder.translatesAutoresizingMaskIntoConstraints = false
        return placeholder
    }()
    
    let addImageButton: UIButton = {
        let addButton = UIButton()
        let image = UIImage(named: "camera_button") as UIImage?
        addButton.setImage(image, for: .normal)        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
        return addButton
    }()
    
    
    
    let firstNameContainer: UIView = {
        let firstNameView = UIView()
        firstNameView.translatesAutoresizingMaskIntoConstraints = false
        return firstNameView
    }()
    
    let firstNameLabel: UILabel = {
        let firstNameLabel = UILabel()
        firstNameLabel.text = "First Name"
        firstNameLabel.font = UIFont(name: Fonts.SFUITextRegular, size: 16)
        firstNameLabel.adjustsFontSizeToFitWidth = true
        firstNameLabel.textColor = UIColor.gray
        firstNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return firstNameLabel
    }()
    
    let firstNameText: UITextField = {
        let firstNameText = UITextField ()
        firstNameText.font = UIFont(name: Fonts.SFUITextRegular, size: 16)
        firstNameText.isUserInteractionEnabled = true
        firstNameText.translatesAutoresizingMaskIntoConstraints = false
        return firstNameText
    }()
    
    let lastNameContainer: UIView = {
        let lastNameView = UIView()
        lastNameView.layer.borderWidth = 0.4
        lastNameView.layer.borderColor = UIColor.gray.cgColor
        lastNameView.translatesAutoresizingMaskIntoConstraints = false
        return lastNameView
    }()
    
    let lastNameLabel: UILabel = {
        let lastNameLabel = UILabel()
        lastNameLabel.text = "Last Name"
        lastNameLabel.font = UIFont(name: Fonts.SFUITextRegular, size: 16)
        lastNameLabel.adjustsFontSizeToFitWidth = true
        lastNameLabel.textColor = UIColor.gray
        lastNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return lastNameLabel
    }()
    
    let lastNameText: UITextField = {
        let lastNameText = UITextField ()
        lastNameText.font = UIFont(name: Fonts.SFUITextRegular, size: 16)
        lastNameText.isUserInteractionEnabled = true
        lastNameText.translatesAutoresizingMaskIntoConstraints = false
        return lastNameText
    }()
    
    let mobileNumberContainer: UIView = {
        let mobileView = UIView()
        mobileView.translatesAutoresizingMaskIntoConstraints = false
        return mobileView
    }()
    
    let mobileNumberLabel: UILabel = {
        let mobileLabel = UILabel()
        mobileLabel.text = "mobile"
        mobileLabel.font = UIFont(name: Fonts.SFUITextRegular, size: 16)
        mobileLabel.adjustsFontSizeToFitWidth = true
        mobileLabel.textColor = UIColor.gray
        mobileLabel.translatesAutoresizingMaskIntoConstraints = false
        return mobileLabel
    }()
    
    let mobileNumberText: UITextField = {
        let mobileText = UITextField ()
        mobileText.font = UIFont(name: Fonts.SFUITextRegular, size: 16)
        mobileText.textAlignment = .left
        mobileText.isUserInteractionEnabled = true
        mobileText.keyboardType = .numberPad
        mobileText.translatesAutoresizingMaskIntoConstraints = false
        return mobileText
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
        email.font = UIFont(name: Fonts.SFUITextRegular, size: 16)
        email.isUserInteractionEnabled = true
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
        
        topViewContainer.addSubview(addImageButton)
        //        layout for addImageView
        NSLayoutConstraint.activate([
            addImageButton.topAnchor.constraint(equalTo: placeHolderImageView.topAnchor, constant: 109),
            addImageButton.leftAnchor.constraint(equalTo: placeHolderImageView.leftAnchor, constant: 111),
            // addImageView.rightAnchor.constraint(equalTo: placeHolderImageView.rightAnchor, constant: -22),
            addImageButton.widthAnchor.constraint(equalToConstant: 41),
            addImageButton.heightAnchor.constraint(equalToConstant: 41)])
        
        
        view.addSubview(firstNameContainer)
        //        layout for firstNameContainer
        NSLayoutConstraint.activate([
            firstNameContainer.topAnchor.constraint(equalTo: topViewContainer.bottomAnchor),
            firstNameContainer.leftAnchor.constraint(equalTo: view.leftAnchor),
            firstNameContainer.rightAnchor.constraint(equalTo: view.rightAnchor),
            firstNameContainer.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        firstNameContainer.addSubview(firstNameLabel)
        //        layout for firstNameLabel
        NSLayoutConstraint.activate([
            firstNameLabel.topAnchor.constraint(equalTo: firstNameContainer.topAnchor, constant: 18),
            firstNameLabel.leftAnchor.constraint(equalTo: firstNameContainer.leftAnchor, constant: 22),
            firstNameLabel.widthAnchor.constraint(equalToConstant: 77),
            firstNameLabel.heightAnchor.constraint(equalToConstant: 19)
        ])
        
        firstNameContainer.addSubview(firstNameText)
        //        layout for firstNameText
        NSLayoutConstraint.activate([
            firstNameText.topAnchor.constraint(equalTo: firstNameContainer.topAnchor, constant: 18),
            firstNameText.heightAnchor.constraint(equalToConstant: 19),
            firstNameText.leftAnchor.constraint(equalTo: firstNameLabel.rightAnchor, constant: 21),
            firstNameText.rightAnchor.constraint(equalTo: firstNameContainer.rightAnchor, constant: -10)
        ])
        
        
        view.addSubview(lastNameContainer)
        //        layout for lastNameContainer
        NSLayoutConstraint.activate([
            lastNameContainer.topAnchor.constraint(equalTo: firstNameContainer.bottomAnchor),
            lastNameContainer.leftAnchor.constraint(equalTo: view.leftAnchor),
            lastNameContainer.rightAnchor.constraint(equalTo: view.rightAnchor),
            lastNameContainer.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        lastNameContainer.addSubview(lastNameLabel)
        //        layout for lastNameLabel
        NSLayoutConstraint.activate([
            lastNameLabel.topAnchor.constraint(equalTo: lastNameContainer.topAnchor, constant: 18),
            lastNameLabel.leftAnchor.constraint(equalTo: lastNameContainer.leftAnchor, constant: 22),
            lastNameLabel.widthAnchor.constraint(equalToConstant: 77),
            lastNameLabel.heightAnchor.constraint(equalToConstant: 19)
        ])
        
        lastNameContainer.addSubview(lastNameText)
        //        layout for lastNameText
        NSLayoutConstraint.activate([
            lastNameText.topAnchor.constraint(equalTo: lastNameContainer.topAnchor, constant: 18),
            lastNameText.heightAnchor.constraint(equalToConstant: 19),
            lastNameText.leftAnchor.constraint(equalTo: lastNameLabel.rightAnchor, constant: 21),
            lastNameText.rightAnchor.constraint(equalTo: lastNameContainer.rightAnchor, constant: -10)
        ])
        
        view.addSubview(mobileNumberContainer)
        //        layout for mobileNumberContainer
        NSLayoutConstraint.activate([
            mobileNumberContainer.topAnchor.constraint(equalTo: lastNameContainer.bottomAnchor),
            mobileNumberContainer.leftAnchor.constraint(equalTo: view.leftAnchor),
            mobileNumberContainer.rightAnchor.constraint(equalTo: view.rightAnchor),
            mobileNumberContainer.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        mobileNumberContainer.addSubview(mobileNumberLabel)
        //        layout for mobileNumberLabel
        NSLayoutConstraint.activate([
            mobileNumberLabel.topAnchor.constraint(equalTo: mobileNumberContainer.topAnchor, constant: 18),
            mobileNumberLabel.leftAnchor.constraint(equalTo: mobileNumberContainer.leftAnchor, constant: 54),
            mobileNumberLabel.widthAnchor.constraint(equalToConstant: 44),
            mobileNumberLabel.heightAnchor.constraint(equalToConstant: 19)
        ])
        
        mobileNumberContainer.addSubview(mobileNumberText)
        //        layout for mobileNumberText
        NSLayoutConstraint.activate([
            mobileNumberText.topAnchor.constraint(equalTo: mobileNumberContainer.topAnchor, constant: 18),
            mobileNumberText.heightAnchor.constraint(equalToConstant: 19),
            mobileNumberText.leftAnchor.constraint(equalTo: mobileNumberLabel.rightAnchor, constant: 21),
            mobileNumberText.rightAnchor.constraint(equalTo: mobileNumberContainer.rightAnchor, constant: -10)
        ])
        
        view.addSubview(emailContainer)
        //        layout for emailContainer
        NSLayoutConstraint.activate([
            emailContainer.topAnchor.constraint(equalTo: mobileNumberContainer.bottomAnchor),
            emailContainer.leftAnchor.constraint(equalTo: view.leftAnchor),
            emailContainer.rightAnchor.constraint(equalTo: view.rightAnchor),
            emailContainer.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        emailContainer.addSubview(emailLabel)
        //        layout for emailLabel
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: emailContainer.topAnchor, constant: 18),
            emailLabel.leftAnchor.constraint(equalTo: emailContainer.leftAnchor, constant: 64),
            emailLabel.widthAnchor.constraint(equalToConstant: 38),
            emailLabel.heightAnchor.constraint(equalToConstant: 19)
        ])
        
        emailContainer.addSubview(emailText)
        //        layout for emailText
        NSLayoutConstraint.activate([
            emailText.topAnchor.constraint(equalTo: emailContainer.topAnchor, constant: 18),
            emailText.heightAnchor.constraint(equalToConstant: 19),
            emailText.leftAnchor.constraint(equalTo: emailLabel.rightAnchor, constant: 21),
            emailText.rightAnchor.constraint(equalTo: emailContainer.rightAnchor, constant: -10)
        ])
    }
    
    
   
    
    @objc func addTapped(){
        navigationController?.popViewController(animated: true)
        //let url = 
    }
    
    @objc func backToContactDetailScreen(){
        navigationController?.popViewController(animated: true)
    }
    
    
    @objc func pickImage() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        let actionsheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        actionsheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action: UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                imagePickerController.sourceType = .camera
                self.present(imagePickerController,animated: true, completion: nil)
            }
            print("Camera not available")
        }))
        
        actionsheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action: UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController,animated: true, completion: nil)
        }))
        
        actionsheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionsheet,animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //to get the real information of image which the user has picked
        let image = info[.originalImage] as! UIImage
        placeHolderImageView.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
        activeTextField.autocorrectionType = .no
        parentView = activeTextField.superview!
    }
    
 
    
    
    @objc func keyboardWillShow(notification : NSNotification ) {
           guard let userInfo = notification.userInfo else { return }
           guard let keyboardSize = userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue else { return }
           let keybardFrame = keyboardSize.cgRectValue
           let keyboardYaxis = self.view.frame.size.height - keybardFrame.height
           let editTextFieldY: CGFloat = parentView.frame.origin.y
           
           if self.view.frame.origin.y >= 0 {
               if editTextFieldY > keyboardYaxis - 60 {
                   UIView.animate(withDuration: 0.25, delay: 0, options: UIView.AnimationOptions.curveEaseIn, animations: {
                       self.view.frame = CGRect(x: 0, y: self.view.frame.origin.y - (editTextFieldY - (keyboardYaxis - 80)), width: self.view.bounds.width, height: self.view.bounds.height)
                   }, completion: nil)
               }
           }
       }
    
    
   @objc func keyboardWillHide(notification : NSNotification){
       UIView.animate(withDuration: 0.25, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
           self.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
       }, completion: nil)
   }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
}


