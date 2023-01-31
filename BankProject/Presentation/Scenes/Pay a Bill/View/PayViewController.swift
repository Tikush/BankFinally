//
//  PayViewController.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 16.01.23.
//

import UIKit

class PayViewController: BaseViewController {
    
    // MARK: - Private IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Private Properties
    
    private var datasource: PayDataSource!
    private var viewModel: PayViewModelProtocol!
    
    // MARK: - Life Cyrcle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCell()
        configure()
    }
    
    private func registerCell() {
        tableView.registerNib(class: PaymentCell.self)
    }
    
    private func configure() {
        viewModel = PayViewModel(with: coordinator!)
        datasource = PayDataSource(tableView: tableView, viewModel: viewModel)
    }
    
    @IBAction func onCategories(_ sender: Any) {
        coordinator?.goToCategories()
    }
}
