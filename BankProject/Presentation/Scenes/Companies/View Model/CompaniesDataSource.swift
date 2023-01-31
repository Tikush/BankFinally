//
//  CompaniesDataSource.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 27.01.23.
//

import UIKit

class CompaniesDataSource: NSObject, UITableViewDataSource {
    
    // MARK: - Private Properties
    
    private var tableView: UITableView!
    private var viewModel: CompaniesListViewModelProtocol!
    private var companies: [CompanyViewModel] = []
    
    init(tableView: UITableView, viewModel: CompaniesListViewModelProtocol) {
        super.init()
        self.tableView = tableView

        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.viewModel = viewModel
    }
    
    func getCompanies() {
        viewModel.fetchIDs()
        viewModel.fetchCompanies { [weak self] companies in
           
            DispatchQueue.main.async {
                self?.companies = companies
                self?.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        companies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(CompanyCell.self, for: indexPath)
        cell.configure(with: companies[indexPath.row])
        return cell
    }
}

extension CompaniesDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.controller.coordinator?.goToCompanyDetails(with: companies[indexPath.row].name, imageUrl: companies[indexPath.row].imageUrl)
    }
}
