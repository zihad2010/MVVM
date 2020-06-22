//
//  UserDetailsViewController.swift
//  MVVM
//
//  Created by Steve JobsOne on 6/20/20.
//  Copyright © 2020 Steve JobsOne. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    
    var userDetailsViewModel = UserDetailsViewModel()
    
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
        loadUserDetails()
    }
    
    //MARK: - Private Methods
    private func loadUserDetails(){
        let userDetails = userDetailsViewModel.getUserDetails()
        self.userNameLabel.text = userDetails.username
        self.emailLabel.text = userDetails.email
        self.streetLabel.text = userDetails.street
        self.cityLabel.text = userDetails.city
        self.zipCodeLabel.text = userDetails.zipCode
        self.webSiteLabel.text = userDetails.website
        self.companyNameLabel.text = userDetails.company
        self.catchparaseLabel.text = userDetails.catchPhrase
    }
}
