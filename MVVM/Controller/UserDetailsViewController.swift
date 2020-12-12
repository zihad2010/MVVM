//
//  UserDetailsViewController.swift
//  MVVM
//
//  Created by Steve JobsOne on 6/20/20.
//  Copyright © 2020 Steve JobsOne. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    lazy var userDetailsViewModel = UserDetailsViewModel()
    
    // MARK: -User Info
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var zipCodeLabel: UILabel!
    @IBOutlet weak var webSiteLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var catchparaseLabel: UILabel!
    
    // MARK: - View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userDetailsViewModel.fetchUser { [weak self](user) in
            guard let itSelf = self else{
                return
            }
            itSelf.userNameLabel.text = user.username
            itSelf.emailLabel.text = user.email
            itSelf.streetLabel.text = user.street
            itSelf.cityLabel.text = user.city
            itSelf.zipCodeLabel.text = user.zipCode
            itSelf.webSiteLabel.text = user.website
            itSelf.companyNameLabel.text = user.company
            itSelf.catchparaseLabel.text = user.catchPhrase
        }
    }
}


