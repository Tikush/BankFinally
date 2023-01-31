//
//  CategoryViewController.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 20.01.23.
//

import UIKit

class CategoriesListViewController: BaseViewController {
    
    // MARK: - Private IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchView: UIView!
    @IBOutlet private weak var searchTextField: UITextField!
    
    // MARK: - Private Properties
    
    private var networkManager: NetworkManagerProtocol!
    private var paymentManager: PaymentManagerProtocol!
    private var viewModel: CategoriesListViewModelProtocol!
    private var datasource: CategoriesDataSource!
    
    // MARK: - Life Cyrcle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        registerCell()
        setupViewModel()
    }
    
    private func setupLayout() {
        searchView.customCornerView(cornerRadius: 7, borderWidth: 0.3, borderColor: Constants.Color.navyBlue)
    }
    
    private func registerCell() {
        tableView.registerNib(class: CategoryCell.self)
    }
    
    private func setupViewModel() {
        networkManager = NetworkManager()
        paymentManager = PaymentManager(with: networkManager)
        viewModel = CategoriesListViewModel(with: paymentManager, controller: self, navigationController: navigationController)
        datasource = CategoriesDataSource(tableView: tableView, viewModel: viewModel)
        
        datasource.getCategories()
    }
    
    @IBAction func onBack(_ sender: Any) {
        viewModel.controller.navigationController?.popViewController(animated: true)
    }
}
