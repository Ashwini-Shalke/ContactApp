//
//  TableViewCell.swift
//  ContactApplication
//
//  Created by Ashwini shalke on 18/10/19.
//  Copyright © 2019 Ashwini Shalke. All rights reserved.
//

import Foundation
import UIKit

class TableViewCell : UITableViewCell {
    
    var link: HomeScreen?
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let starButton = UIButton()
        starButton.setImage(UIImage(imageLiteralResourceName: "favourite_button"), for: .normal)
        starButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        accessoryView = starButton
        starButton.addTarget(self, action: #selector(handleFavStar), for: .touchUpInside)
        autolayout()
    
    }

    
    let profileImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.round()
        imgView.clipsToBounds = true
        return imgView
    }()
   
    let nameLabel:UILabel = {
          let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
          return label
      }()
    
    func autolayout(){
        self.contentView.addSubview(profileImageView)
        profileImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant:50).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant:50).isActive = true
        
        self.contentView.addSubview(nameLabel)
        nameLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor,constant: 72).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor).isActive = true
    }
    
    @objc func handleFavStar() {
        //link?.someMethod(cell: self)
        
    
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
