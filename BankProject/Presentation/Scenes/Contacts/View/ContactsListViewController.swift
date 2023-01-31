//
//  ContactsListViewController.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 25.01.23.
//

import UIKit

class ContactsListViewController: BaseViewController {
    
    // MARK: - Private IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchView: UIView!
    @IBOutlet private weak var searchTextField: UITextField!
    
    // MARK: - Private Properties
    
    private var viewModel: ContactsListViewModelProtocol!
    private var datasource: ContactsListDataSource!
    private var contactManager: ContactManagerProtocol!
    
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
        tableView.registerNib(class: ContactCell.self)
    }
    
    private func setupViewModel() {
        contactManager = ContactManager()
        viewModel = ContactsListViewModel(with: self, contactManager: contactManager)
        datasource = ContactsListDataSource(tableView: tableView, viewModel: viewModel)
        
        datasource.getContacts()
    }
    
    @IBAction func onBack(_ sender: Any) {
        viewModel.controller.navigationController?.popViewController(animated: true)
    }
}
