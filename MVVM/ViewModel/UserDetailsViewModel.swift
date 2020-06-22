//
//  UserDetailsViewModel.swift
//  MVVM
//
//  Created by Steve JobsOne on 6/20/20.
//  Copyright © 2020 Steve JobsOne. All rights reserved.
//

import Foundation

protocol UserDetailsViewModelProtocal {

    func notifyWithUserDetails(userDetails: UserDetails)
}

class UserDetailsViewModel {
  
    var delegate: UserDetailsViewModelProtocal?
    var userDetails :UserDetails?
    
    func getUserDetails() -> UserDetails {
        return userDetails!
    }
    
}
