//
//  UserInfoDetails.swift
//  MVVM
//
//  Created by Steve JobsOne on 6/20/20.
//  Copyright © 2020 Steve JobsOne. All rights reserved.
//

import Foundation

struct UserInfoDetails: Codable {
    
    var id: Int?
    var name: String?
    var username: String?
    var email: String?
    var address: Address?
    var phone: String?
    var company: Company?
    var website: String?

}

struct Address: Codable {
    
    var street: String?
    var suite: String?
    var city: String?
    var geo: Geo?
    var zipcode: String?
}

struct Geo: Codable {
    
    var lat: String?
    var lag: String?
}

struct Company: Codable {
    
    var name: String?
    var catchPhrase: String?
    var bs: String?
}


