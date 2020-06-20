//
//  UserViewModel.swift
//  MVVM
//
//  Created by Steve JobsOne on 6/20/20.
//  Copyright © 2020 Steve JobsOne. All rights reserved.
//

import Foundation

protocol UserViewModelDelegate {
    func reloadListOfUserWith()
}
class UserViewModel {
    
    var userInfoDetails = [UserInfoDetails]()
    
    
    typealias handeler = ([UserInfoDetails]) -> Void
    
    var delegate: UserViewModelDelegate?
    
    func numberOfRow() -> Int {
        return self.userInfoDetails.count
    }
    func eachUser(indexPath: IndexPath) -> UserInfo {
        return UserInfo(userInfoDetails:userInfoDetails[indexPath.row])
    }
}

extension UserViewModel{
    
    func getUserList() {
        NetworkManager.shared.sendRequest(url: "https://jsonplaceholder.typicode.com/users") {[weak self] (result) in
            guard let itSelf = self else {
                return
            }
            switch result{
            case .networkFinishedWithData(let data):
                itSelf.parseData(data: data)
                itSelf.delegate?.reloadListOfUserWith()
                print(data)
                break
            case .networkFinishedWithError(let error):
                print("error", error)
                break
            }
        }
    }
    
    func parseData(data: Data) {
        
        JSONDecoder.decodeData(model: [UserInfoDetails].self, data) {[weak self] (result) in
            
            guard let itSelf = self else{
                return
            }
            switch result{
            case .success(let data ):
                itSelf.userInfoDetails = data as! [UserInfoDetails]
                break
            case .failure(let mess):
                print("Parse data error:",mess)
                break
            }
        }
        
    }
}
