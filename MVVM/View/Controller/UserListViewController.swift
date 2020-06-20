//
//  UserListViewController.swift
//  MVVM
//
//  Created by Steve JobsOne on 6/20/20.
//  Copyright © 2020 Steve JobsOne. All rights reserved.
//

import UIKit

class UserListViewController: UIViewController {
    
    var userViewModel = UserViewModel()
    
    // MARK: View Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userViewModel.delegate = self
        self.userViewModel.getUserList()
    }
    
    // MARK: TableView Info
    @IBOutlet weak var tableView: UITableView!
    var userInfo = [UserInfo(name: "asraful", email: "asraful@gmail.com", phone: "01989146497"),
                    UserInfo(name: "asraful", email: "asraful@gmail.com", phone: "01989146497"),
                    UserInfo(name: "asraful", email: "asraful@gmail.com", phone: "01989146497"),
                    UserInfo(name: "asraful", email: "asraful@gmail.com", phone: "01989146497")]
    
    
}

// MARK: UserViewModelDelegate implementation

extension UserListViewController: UserViewModelDelegate{
    
    func reloadListOfUserWith(userInfo: [UserInfo]) {
        if userInfo.count != 0 {
            self.tableView.reloadData()
        }
    }
}

//MARK: table view delegate & datasource implementation

extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userInfoCell = self.tableView.dequeueReusableCell(withIdentifier: "UserInfoCell") as! UserInfoCell
        userInfoCell.eachUser = userInfo[indexPath.row]
        return userInfoCell
    }
}
