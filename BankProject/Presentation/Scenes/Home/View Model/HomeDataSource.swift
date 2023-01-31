//
//  HomeDataSource.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 16.01.23.
//

import UIKit

class HomeDataSource: NSObject, UITableViewDataSource {
    
    // MARK: - Private Properties
    
    private var tableView: UITableView!
    private var viewModel: HomeViewModelProtocol!
    
    init(tableView: UITableView, viewModel: HomeViewModelProtocol) {
        
        self.tableView = tableView
        super.init()
        
        self.tableView.dataSource = self
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.deque(CardCell.self, for: indexPath)
            cell.configure(with: viewModel.controller.coordinator!)
            return cell
            
        case 1:
            let cell = tableView.deque(OfferListCell.self, for: indexPath)
            cell.configure(with: viewModel.controller.coordinator!)
            return cell
            
        case 2:
            let cell = tableView.deque(InviteCell.self, for: indexPath)
            cell.configure(with: viewModel.controller.coordinator!)
            return cell
            
        case 3:
            let cell = tableView.deque(HelpCell.self, for: indexPath)
            cell.configure(with: viewModel.controller.coordinator!)
            return cell
            
        default:
            return UITableViewCell()
        }
    }
}

