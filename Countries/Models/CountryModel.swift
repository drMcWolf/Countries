//
//  CountryModel.swift
//  Countries
//
//  Created by Макаров Иван on 17/02/2019.
//  Copyright © 2019 123. All rights reserved.
//

import Foundation

struct CountryModel: Codable {
    let name: String
    let population: Int
    let capital: String?
    let borders: [String]?
    let currencies: [Currency]?
}

struct Currency: Codable {
    let code: String?
    let name: String?
    let symbol: String?
}
