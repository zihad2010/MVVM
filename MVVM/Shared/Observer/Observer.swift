//
//  Observer.swift
//  MVVM
//
//  Created by Steve JobsOne on 12/10/20.
//  Copyright © 2020 Steve JobsOne. All rights reserved.
//

import Foundation

protocol Observer {
    var id: Int { get }
    func reloadData()
}

protocol ObservableProtocol : class {
    var observers : [ObserverProtocol] { get set }

    func addObserver(_ observer: ObserverProtocol)
    func removeObserver(_ observer: ObserverProtocol)
    func notifyObservers(_ observers: [ObserverProtocol])
}

protocol ObserverProtocol {

    var id : Int { get set }
    func onValueChanged(_ value: Any?)
}
