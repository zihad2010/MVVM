//
//  UserInfo.swift
//  MVVM
//
//  Created by Steve JobsOne on 6/20/20.
//  Copyright © 2020 Steve JobsOne. All rights reserved.
//

import Foundation

struct UserInfo {
    
    var name: String
    var email: String
    var phone: String
    
    init(userInfoDetails: UserInfoDetails) {
        self.name = userInfoDetails.name!
        self.email = userInfoDetails.email!
        self.phone = userInfoDetails.phone!
    }
}
