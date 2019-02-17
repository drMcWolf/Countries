//
//  CountryViewModel.swift
//  Countries
//
//  Created by Макаров Иван on 17/02/2019.
//  Copyright © 2019 123. All rights reserved.
//

import Foundation

protocol CountryViewModelProtocol {
    var name: String { get }
    var populationTitle: String { get }
}

class CountryViewModel: CountryViewModelProtocol {
    private let model: CountryModel
    
    var name: String {
        return model.name
    }
    
    var populationTitle: String {
        return "Population: \(model.population)"
    }
    
    init(with model: CountryModel) {
        self.model = model
    }
}
