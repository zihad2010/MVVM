//
//  UserDetailsViewModel.swift
//  MVVM
//
//  Created by Steve JobsOne on 6/20/20.
//  Copyright © 2020 Steve JobsOne. All rights reserved.
//

import Foundation


struct UserDetailsViewModel {
  
    var userDetails :UserDetails?
   

    func fetchUser(handeler: (UserDetails)-> Void)  {
        handeler(userDetails!)
    }
}
