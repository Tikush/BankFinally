//
//  HelpDetailsViewController.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 24.01.23.
//

import UIKit

class HelpDetailsViewController: BaseViewController {
    
    // MARK: - Private IBOutlets

    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Private Properties
    
    private var viewModel: HelpDetailsViewModelProtocol!
    private var datasource: HelpDetailsDataSource!
    private var helpManager: HelpManagerProtocol!
    private var networkManager: NetworkManagerProtocol!
    
    // MARK: - Life Cyrcle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCell()
        configureViewModel()
    }
    
    private func registerCell() {
        tableView.registerNib(class: HelpDetailsCell.self)
    }
    
    private func configureViewModel() {
        networkManager = NetworkManager()
        helpManager = HelpManager(with: networkManager)
        viewModel = HelpDetailsViewModel(with: helpManager)
        datasource = HelpDetailsDataSource(tableView: tableView, viewModel: viewModel)
        
        datasource.getHelpsList()
    }
}
