//
//  PayDataSource.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 20.01.23.
//

import UIKit

class PayDataSource: NSObject, UITableViewDataSource {
    
    // MARK: - Private Properties
    
    private var tableView: UITableView!
    private var viewModel: PayViewModelProtocol!
    
    init(tableView: UITableView!, viewModel: PayViewModelProtocol) {
        super.init()
        self.tableView = tableView
        self.tableView.dataSource = self
        
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.deque(PaymentCell.self, for: indexPath)
            cell.configure(coordinator: viewModel.coordinator)
            return cell
            
        default:
            return UITableViewCell()
        }
    }
}
