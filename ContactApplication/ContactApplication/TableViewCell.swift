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
        
    }
    
    
    @objc func handleFavStar() {
        link?.someMethod(cell: self)
        
    
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
