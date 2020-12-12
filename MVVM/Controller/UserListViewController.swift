//
//  UserListViewController.swift
//  MVVM
//
//  Created by Steve JobsOne on 6/20/20.
//  Copyright © 2020 Steve JobsOne. All rights reserved.
//

import UIKit


class UserListViewController: UIViewController,UITableViewDelegate {
    
    // MARK: - TableView Info
    @IBOutlet weak var tableView: UITableView!
    
    let dataSource = UserInfoDetailsDataSource()
   
    var id: Int = 1
    
    lazy var userViewModel: UserViewModel = {
        let viewModel = UserViewModel(dataSource: dataSource)
        return viewModel
    }()

    // MARK: - View Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self
        self.userViewModel.getUserList()
        self.userViewModel.dataSource?.data.addObserver(self)
        
    }
    
    //MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let userDetailsViewController = segue.destination as! UserDetailsViewController
        userDetailsViewController.userDetailsViewModel.userDetails = dataSource.faceUserDetails(indexPath: sender as! IndexPath)

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: SegueConstant.userDetailsViewController.identifier , sender: indexPath)
    }

}

extension UserListViewController: ObserverProtocol{
    
    func onValueChanged(_ value: Any?) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
