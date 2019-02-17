//
//  Box.swift
//  AYS
//
//  Created by Макаров Иван on 13.06.2018.
//  Copyright © 2018 Velvetech, LLC. All rights reserved.
//

import Foundation

class Box<T> {
    typealias Listener = (T) -> Void
    private var listener: Listener?
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    func unbind() {
        listener = nil
    }
    
    func bind(listner: @escaping Listener) {
        self.listener = listner
        self.listener?(value)
    }
}
