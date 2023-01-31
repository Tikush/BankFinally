//
//  CategoriesDataSource.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 22.01.23.
//

import UIKit

class CategoriesDataSource: NSObject, UITableViewDataSource {
    
    // MARK: - Private Properties
    
    private var tableView: UITableView!
    private var viewModel: CategoriesListViewModelProtocol!
    private var categories: [CategoryViewModel] = []
    
    init(tableView: UITableView, viewModel: CategoriesListViewModelProtocol) {
        super.init()
        self.tableView = tableView

        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.viewModel = viewModel
    }
    
    func getCategories() {
        viewModel.fetchCategories { [weak self] categories in
            DispatchQueue.main.async {
                self?.categories = categories
                self?.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(CategoryCell.self, for: indexPath)
        cell.configure(with: categories[indexPath.row])
        return cell
    }
}

extension CategoriesDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.controller.coordinator?.goToCompanies(with: categories[indexPath.row].name)
    }
}
