//
//  UserListViewController+Extention.swift
//  MVVM
//
//  Created by Steve JobsOne on 12/11/20.
//  Copyright © 2020 Steve JobsOne. All rights reserved.
//
import Foundation
import UIKit

class GenericDataSource<T>: NSObject {
    var data: Observable<[T]> = Observable(value: [])
}


class UserInfoDetailsDataSource: GenericDataSource<UserInfoDetails>, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userInfoCell = tableView.dequeueReusableCell(withIdentifier: "UserInfoCell") as! UserInfoCell
        userInfoCell.eachUser = UserInfo(userInfoDetails: data.value[indexPath.row])
        return userInfoCell
    }
    
    func faceUserDetails<T>(indexPath: IndexPath) -> T {
        return UserDetails(userInfoDetails: data.value[indexPath.row]) as! T
    }
}


