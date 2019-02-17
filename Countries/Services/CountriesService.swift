//
//  CountriesService.swift
//  Countries
//
//  Created by Макаров Иван on 17/02/2019.
//  Copyright © 2019 123. All rights reserved.
//

import Foundation
import Moya
import RxSwift

protocol CountriesServiceProtocol {
    func getCountriesList(completion: @escaping (_ models: [CountryModel], _ error: Error?) -> Void)
    func getCountryDetails(name: String, completion: @escaping (_ model: CountryModel?, _ error: Error?) -> Void)
}

class CountriesService: CountriesServiceProtocol {
    private let provider = MoyaProvider<MultiTarget>()
    
    func getCountriesList(completion: @escaping (_ models: [CountryModel], _ error: Error?) -> Void) {
        
        provider.request(MultiTarget(ApiUrl.all)) { (result) in
            switch result {
                case .success(let value):
                    do {
                        let countryModels = try JSONDecoder().decode([CountryModel].self, from: value.data)
                        completion(countryModels, nil)
                    }catch let error{
                        completion([], error)
                    }
                case .failure(let error):
                    completion([], error)
            }
        }
    }
    
    func getCountryDetails(name: String, completion: @escaping (_ model: CountryModel?, _ error: Error?) -> Void) {
        
        provider.request(MultiTarget(ApiUrl.name(name: name))) { (result) in
            switch result {
                case .success(let value):
                    do {
                        let model = try JSONDecoder().decode([CountryModel].self, from: value.data)
                        completion(model.first, nil)
                    }catch let error {
                        completion(nil, error)
                    }
                case .failure(let error): completion(nil, error)
            }
        }
    }
}
