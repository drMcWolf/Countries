//
//  CountriesWireframe.swift
//  Countries
//
//  Created by Макаров Иван on 17/02/2019.
//  Copyright © 2019 123. All rights reserved.
//

import UIKit

protocol CountriesWireframeProtocol {
    func onDetails(for country: CountryModel)
}

class CountriesWireframe: CountriesWireframeProtocol {
    private weak var viewController: UIViewController?
    
    init(with viewController: UIViewController) {
        self.viewController = viewController
    }

    func onDetails(for country: CountryModel) {
        let countryDetailsViewController = UIStoryboard(name: "Countries", bundle: nil).instantiateViewController(withIdentifier: "CountryDetailsViewController") as! CountryDetailsViewController
        countryDetailsViewController.viewModel = CountryDetailsViewModel(with: country)
        viewController?.navigationController?.pushViewController(countryDetailsViewController, animated: true)
    }
}
