//
//  Networking.swift
//  CleanSwift(VIP)
//
//  Created by Steve JobsOne on 4/14/20.
//  Copyright © 2020 Steve JobsOne. All rights reserved.
//

import Foundation
import UIKit

enum Result<data,error> {
    case networkFinishedWithData(data)
    case networkFinishedWithError(error)
}

typealias Handler = (Result<Data,Error>) -> Void

enum NetworkError: Error{
    case nullData
    case data
    case offline
    case invalidURL
    case undefined
}

//MARK: - Network Client

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func sendRequest(url: String, completion: @escaping (Handler)) {
        
        guard let url = URL(string: url) else {
            completion(.networkFinishedWithError(NetworkError.invalidURL))
            return
        }
        
        let task = URLSession.session().dataTask(with: url, completionHandler: {[weak self](data, response, error) in
    
            guard self != nil else{
                return
            }
                if let networkError = error {
                    if let nsError = networkError as NSError? {
                        switch nsError.code {
                        case -1009:
                            completion(.networkFinishedWithError(NetworkError.offline))
                            break
                        default:
                            print("nsError & message:",nsError.code,networkError.localizedDescription)
                            completion(.networkFinishedWithError(NetworkError.undefined))
                            break
                        }
                    }
                    return
                }
            completion(.networkFinishedWithData(data!))
        })
        task.resume()
    }
}




