//
//  CountryDetailsViewModel.swift
//  Countries
//
//  Created by Макаров Иван on 17/02/2019.
//  Copyright © 2019 123. All rights reserved.
//

import Foundation

protocol CountryDetailsViewModelProtocol {
    func numberOfItems(in section: Int) -> Int
    func item(at index: Int, in section: Int) -> CountryDetailsItemViewModelProtocol
}

class CountryDetailsViewModel: CountryDetailsViewModelProtocol {
    private let model: CountryModel
    private var viewModels = [CountryDetailsItemViewModel]()
    
    init(with model: CountryModel) {
        self.model = model
        
        let countryNameViewModel = CountryDetailsItemViewModel(with: "Name: ", subTitle: self.model.name)
        let capitalNameViewModel = CountryDetailsItemViewModel(with: "Capital: ", subTitle: self.model.capital ?? "")
        let populationViewModel = CountryDetailsItemViewModel(with: "Population: ", subTitle: String(self.model.population))
        let bordersViewModel = CountryDetailsItemViewModel(with: "Borders: ", subTitle: self.model.borders?.joined(separator: ", ") ?? "-")
        let currenciesViewModel = CountryDetailsItemViewModel(with: "Currencies: ", subTitle: self.model.currencies?.map({ $0.name ?? "" }).joined(separator: ", ")  ?? "-")
        
        viewModels.append(contentsOf: [countryNameViewModel, capitalNameViewModel, populationViewModel, bordersViewModel, currenciesViewModel])
    }
    
    func numberOfItems(in section: Int) -> Int {
        return viewModels.count
    }
    
    func item(at index: Int, in section: Int) -> CountryDetailsItemViewModelProtocol {
        return viewModels[index]
    }
    
}
