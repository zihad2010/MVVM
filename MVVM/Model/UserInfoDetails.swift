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
    var userName: String?
    var email: String?
    var address: Address?
    var phone: String?
    var company: String

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
    var lan: String?
}

struct Company: Codable {
    
    var name: String?
    var catchPhrase: String?
    var bs: String?
}


