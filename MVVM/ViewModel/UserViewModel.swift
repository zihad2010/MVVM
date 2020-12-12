//
//  UserViewModel.swift
//  MVVM
//
//  Created by Steve JobsOne on 6/20/20.
//  Copyright © 2020 Steve JobsOne. All rights reserved.
//

import Foundation

struct UserViewModel {
    
    weak var dataSource : GenericDataSource<UserInfoDetails>?
    
    init(dataSource: GenericDataSource<UserInfoDetails>?) {
        self.dataSource = dataSource
    }
}

extension UserViewModel{
    
    func getUserList() {
        NetworkManager.shared.sendRequest(url: "https://jsonplaceholder.typicode.com/users") { (result) in
            
            switch result{
            case .networkFinishedWithData(let data):
                parseData(data: data)
                print(data)
                break
            case .networkFinishedWithError(let error):
                print("error", error)
                break
            }
        }
    }
    
     func parseData(data: Data) {
        
        JSONDecoder.decodeData(model: [UserInfoDetails].self, data) { (result) in
            
            switch result{
            case .success(let data ):
                dataSource?.data.value = data as! [UserInfoDetails]
                break
            case .failure(let mess):
                print("Parse data error:",mess)
                break
            }
        }
        
    }
    
}
