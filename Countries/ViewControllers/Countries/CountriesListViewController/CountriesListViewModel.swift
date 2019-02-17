//
//  CountriesListViewModel.swift
//  Countries
//
//  Created by Макаров Иван on 17/02/2019.
//  Copyright © 2019 123. All rights reserved.
//

import Foundation

protocol NetworkProgressProtocol {
    var showError: Box<Error?> { get }
    var showProgress: Box<Bool> { get }
}

protocol CountriesListViewModelProtocol: NetworkProgressProtocol {
    func getModels(completion: @escaping () -> Void)
    func numberOfItems() -> Int
    func item(at index: Int, in section: Int) -> CountryViewModelProtocol
    func select(at index: Int, in section: Int)
}

class CountriesListViewModel: CountriesListViewModelProtocol {
    private let wireframe: CountriesWireframeProtocol
    private let service: CountriesServiceProtocol
    private var viewModels = [CountryViewModel]()
    private var models = [CountryModel]()
    
    var showError: Box<Error?> = Box(value: nil)
    var showProgress: Box<Bool> = Box(value: false)
    
    init(with wireframe: CountriesWireframeProtocol, service: CountriesServiceProtocol) {
        self.wireframe = wireframe
        self.service = service
  
    }
    
    func numberOfItems() -> Int {
        return viewModels.count
    }
    
    func item(at index: Int, in section: Int) -> CountryViewModelProtocol {
        return viewModels[index]
    }
    
    func getModels(completion: @escaping () -> Void) {
        showProgress.value = true
        service.getCountriesList { (models, error) in
            self.showProgress.value = false
            if error != nil {
                self.showError.value = error
                return
            }
            self.viewModels = models.compactMap({ CountryViewModel(with: $0) })
            self.models = models
            completion()
        }
    }
    
    func select(at index: Int, in section: Int) {
        let selectedModel = models[index]
        showProgress.value = true
        service.getCountryDetails(name: selectedModel.name) { (model, error) in
            self.showProgress.value = false
            
            if error != nil {
                self.showError.value = error
                return
            }
            
            if let model = model  {
                self.wireframe.onDetails(for: model)
            }
            
        }
        
    }
}
