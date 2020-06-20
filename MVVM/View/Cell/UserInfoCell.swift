//
//  UserInfoCell.swift
//  MVVM
//
//  Created by Steve JobsOne on 6/20/20.
//  Copyright © 2020 Steve JobsOne. All rights reserved.
//

import UIKit

class UserInfoCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    var eachUser: UserInfo? {
        didSet{
            nameLabel.text = eachUser?.name
            phoneNumLabel.text = eachUser?.phone
            emailLabel.text = eachUser?.email
        }
    }
}
