//
//  CoutryDetailsItemCell.swift
//  Countries
//
//  Created by Макаров Иван on 17/02/2019.
//  Copyright © 2019 123. All rights reserved.
//

import UIKit

class CoutryDetailsItemCell: UITableViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var detailsLabel: UILabel!
    
    private var viewModel: CountryDetailsItemViewModelProtocol?
    
    func configure(with viewModel: CountryDetailsItemViewModelProtocol) {
        self.viewModel = viewModel
        
        titleLabel.text = self.viewModel?.title
        detailsLabel.text = self.viewModel?.subTitle
    }
    
}
