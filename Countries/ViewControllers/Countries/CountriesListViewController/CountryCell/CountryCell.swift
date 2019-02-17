//
//  CountryCell.swift
//  Countries
//
//  Created by Макаров Иван on 17/02/2019.
//  Copyright © 2019 123. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell {
    private var viewModel: CountryViewModelProtocol?
    
    func configure(with viewModel: CountryViewModelProtocol?) {
        
        self.viewModel = viewModel
        
        textLabel?.text = self.viewModel?.name
        detailTextLabel?.text = self.viewModel?.populationTitle
    }
}
