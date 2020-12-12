//
//  Observable.swift
//  MVVM
//
//  Created by Steve JobsOne on 12/10/20.
//  Copyright © 2020 Steve JobsOne. All rights reserved.
//

import Foundation

//class Observable {
//
//    private var observers = [Observer]()
//
//    func receivedARequest() {
//        self.notifyToObserver()
//    }
//
//    func registerAObserver(observer: Observer) {
//        observers.append(observer)
//    }
//
//    private func notifyToObserver() {
//        observers.forEach({$0.reloadData()})
//    }
//
//    func deRegisterObserver(observer:Observer) {
//
//        if let toRemove = self.observers.enumerated().first(where: { $0.element.id == observer.id }){
//            self.observers.remove(at: toRemove.offset)
//        }
//    }
//}

class Observable<T> : ObservableProtocol {

    var value : T {
        didSet {
            self.notifyObservers(self.observers)
        }
    }

    internal var observers : [ObserverProtocol] = []

    init(value: T) {
        self.value = value
    }

    func addObserver(_ observer: ObserverProtocol) {
        guard self.observers.contains(where: { $0.id == observer.id }) == false else {
            return
        }
        self.observers.append(observer)
    }

    func removeObserver(_ observer: ObserverProtocol) {
       
        guard let index = self.observers.firstIndex(where: { $0.id == observer.id }) else {
            return
        }
        self.observers.remove(at: index)

    }

    func notifyObservers(_ observers: [ObserverProtocol]) {
        observers.forEach({ $0.onValueChanged(value)})
    }

    deinit {
        observers.removeAll()
    }
}
