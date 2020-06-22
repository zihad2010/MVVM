//
//  UserListViewController.swift
//  MVVM
//
//  Created by Steve JobsOne on 6/20/20.
//  Copyright © 2020 Steve JobsOne. All rights reserved.
//

import UIKit


class UserListViewController: UIViewController {
    
    private var userViewModel = UserViewModel()
    
    // MARK: - View Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userViewModel.delegate = self
        self.userViewModel.getUserList()
    }
    
    // MARK: - TableView Info
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let userDetailsViewController = segue.destination as! UserDetailsViewController
        userDetailsViewController.userDetailsViewModel.userDetails = userViewModel.getUserDetailsBy(indexPath: sender as! IndexPath)
        
    }
}

// MARK: - UserViewModelDelegate implementation

extension UserListViewController: UserViewModelDelegate{
    
    func reloadListOfUserWith() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

//MARK: - table view delegate & datasource implementation

extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userViewModel.numberOfRow()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userInfoCell = self.tableView.dequeueReusableCell(withIdentifier: "UserInfoCell") as! UserInfoCell
        userInfoCell.eachUser = self.userViewModel.eachUser(indexPath: indexPath)
        return userInfoCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: SegueConstant.userDetailsViewController.identifier , sender: indexPath)
    }
}
