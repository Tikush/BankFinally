//
//  HomeViewController.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 16.01.23.
//

import UIKit

class HomeViewController: BaseViewController {
    
    // MARK: - Private IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Private Properties
    
    private var datasource: HomeDataSource!
    private var viewModel: HomeViewModelProtocol!
    
    // MARK: - Life Cyrcle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        configureDataSource()
    }
    
    private func registerCell() {
        tableView.registerNib(class: CardCell.self)
        tableView.registerNib(class: OfferListCell.self)
        tableView.registerNib(class: InviteCell.self)
        tableView.registerNib(class: HelpCell.self)
    }
    
    private func configureDataSource() {
        viewModel = HomeViewModel(with: self)
        datasource = HomeDataSource(tableView: tableView, viewModel: viewModel)
    }
}
