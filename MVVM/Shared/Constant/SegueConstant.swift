//
//  SegueConstant.swift
//  MVVM
//
//  Created by Steve JobsOne on 6/23/20.
//  Copyright © 2020 Steve JobsOne. All rights reserved.
//

import Foundation
import UIKit

enum SegueConstant: String {
    
    case userDetailsViewController =  "UserDetailsViewController"
    var identifier: String {
        return self.rawValue
    }
}
