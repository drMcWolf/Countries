//
//  CountriesListViewController.swift
//  Countries
//
//  Created by Макаров Иван on 17/02/2019.
//  Copyright © 2019 123. All rights reserved.
//

import UIKit
import MBProgressHUD

class CountriesListViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    private var refreshControll = UIRefreshControl()
    
    var viewModel: CountriesListViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
        viewModel = CountriesListViewModel(with: CountriesWireframe(with: self), service: CountriesService())
        
        setBindings()
        
        update()
        title = "Countries"
    }
    
    private func configureTable() {
        tableView.register(UINib(nibName: "CountryCell", bundle: nil), forCellReuseIdentifier: "CountryCell")
        
        refreshControll = UIRefreshControl()
        refreshControll.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.addSubview(refreshControll)
    }
    
    private func setBindings() {
        viewModel?.showProgress.bind(listner: {[weak self] (show) in
            guard let strSelf = self else {
                return
            }
            
            if show {
                MBProgressHUD.showAdded(to: strSelf.view, animated: true)
            }else {
                MBProgressHUD.hide(for: strSelf.view, animated: true)
            }        
        })
        
        viewModel?.showError.bind(listner: ({[weak self] (error) in
            if let error = error {
                self?.showAlert(with: "", message: error.localizedDescription)
            }
        }))
    }
    
    private func update() {
        viewModel?.getModels(completion: {
            self.refreshControll.endRefreshing()
            self.tableView.reloadData()
        })
        
    }
    
    @objc private func refresh() {
        refreshControll.beginRefreshing()
        update()
    }
    
}


extension CountriesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfItems() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as? CountryCell else {
            return UITableViewCell()
        }
        let countryViewModel = viewModel?.item(at: indexPath.row, in: indexPath.section)
        cell.configure(with: countryViewModel)
        return cell
    }
}

extension CountriesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.select(at: indexPath.row, in: indexPath.section)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
