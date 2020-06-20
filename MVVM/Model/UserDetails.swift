//
//  UserDetails.swift
//  MVVM
//
//  Created by Steve JobsOne on 6/21/20.
//  Copyright © 2020 Steve JobsOne. All rights reserved.
//

import Foundation

struct UserDetails {
    
    var username: String
    var email: String
    var company: String
    var website: String
    var zipCode: String
    var street: String
    var catchPhrase: String
    var city: String
    
    init(userInfoDetails: UserInfoDetails) {
        self.username = userInfoDetails.username!
        self.email = userInfoDetails.email!
        self.company = (userInfoDetails.company?.name!)! as String
        self.website = userInfoDetails.website!
        self.zipCode = (userInfoDetails.address?.zipcode)! as String
        self.street = (userInfoDetails.address?.street)! as String
        self.catchPhrase = (userInfoDetails.company?.catchPhrase!)! as String
        self.city = (userInfoDetails.address?.city!)! as String
    
    }
}
