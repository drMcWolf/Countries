//
//  CountryDetailsItemViewModel.swift
//  Countries
//
//  Created by Макаров Иван on 17/02/2019.
//  Copyright © 2019 123. All rights reserved.
//

import Foundation

protocol CountryDetailsItemViewModelProtocol {
    var title: String { get }
    var subTitle: String { get }
}

class CountryDetailsItemViewModel: CountryDetailsItemViewModelProtocol {
    let title: String    
    let subTitle: String
    
    init(with title: String, subTitle: String) {
        self.title = title
        self.subTitle = subTitle
    }
}
