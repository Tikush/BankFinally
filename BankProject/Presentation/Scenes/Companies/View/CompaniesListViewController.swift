//
//  CompaniesListViewController.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 27.01.23.
//

import UIKit

class CompaniesListViewController: BaseViewController {
    
    // MARK: - Private IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchView: UIView!
    @IBOutlet private weak var searchTextField: UITextField!
    
    // MARK: - Private Properties
    
    private var networkManager: NetworkManagerProtocol!
    private var paymentManager: PaymentManagerProtocol!
    private var viewModel: CompaniesListViewModelProtocol!
    private var datasource: CompaniesDataSource!
    
    // MAEK: - Internal Properties
    
    var categoryName: String?

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
        tableView.registerNib(class: CompanyCell.self)
    }
    
    private func setupViewModel() {
        networkManager = NetworkManager()
        paymentManager = PaymentManager(with: networkManager)
        viewModel = CompaniesListViewModel(with: paymentManager, controller: self, navigationController: navigationController, categoryName: categoryName ?? "")
        datasource = CompaniesDataSource(tableView: tableView, viewModel: viewModel)

        datasource.getCompanies()
    }
    
    @IBAction func onBack(_ sender: Any) {
        viewModel.controller.navigationController?.popViewController(animated: true)
    }
}
