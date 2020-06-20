//
//  UserViewModel.swift
//  MVVM
//
//  Created by Steve JobsOne on 6/20/20.
//  Copyright © 2020 Steve JobsOne. All rights reserved.
//

import Foundation

protocol UserViewModelDelegate {
    func reloadListOfUserWith(userInfo: [UserInfo])
}
class UserViewModel {
    
    typealias handeler = ([UserInfoDetails]) -> Void
    
    var delegate: UserViewModelDelegate?
    func getUserList() {
        NetworkManager.shared.sendRequest(url: "https://jsonplaceholder.typicode.com/users") {[weak self] (result) in
            
            guard let itSelf = self else {
                return
            }
            switch result{
            case .networkFinishedWithData(let data):
               itSelf.parseData(data: data)
                print(data)
                break
            case .networkFinishedWithError(let error):
                print("error", error)
                break
            }
        }
    }
    
}

extension UserViewModel{
    
    func parseData(data: Data) {
        
        JSONDecoder.decodeData(model: [UserInfoDetails].self, data) {[weak self] (result) in
            
            guard self != nil else{
                return
            }
            switch result{
            case .success(let userInfoDetails):
                print("userInfoDetails ",userInfoDetails)
                break
            case .failure(let mess):
                print("Parse data error:",mess)
                break
            }
        }
        
    }
}
