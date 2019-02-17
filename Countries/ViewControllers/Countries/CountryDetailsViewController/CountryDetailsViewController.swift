//
//  CountryDetailsViewController.swift
//  Countries
//
//  Created by Макаров Иван on 17/02/2019.
//  Copyright © 2019 123. All rights reserved.
//

import UIKit

class CountryDetailsViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: CountryDetailsViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CoutryDetailsItemCell", bundle: nil), forCellReuseIdentifier: "CoutryDetailsItemCell")
        title = "Details"
    }
}

extension CountryDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfItems(in: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CoutryDetailsItemCell", for: indexPath) as? CoutryDetailsItemCell else {
            return UITableViewCell()
        }
        
        let detailsViewModel = viewModel.item(at: indexPath.row, in: indexPath.section)
        cell.configure(with: detailsViewModel)
        
        return cell
    }
}

