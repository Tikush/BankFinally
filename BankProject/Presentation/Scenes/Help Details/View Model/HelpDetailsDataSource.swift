//
//  HelpDetailsDataSource.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 26.01.23.
//

import UIKit

class HelpDetailsDataSource: NSObject, UITableViewDataSource {
    
    // MARK: - Private Properties
    
    private var tableView: UITableView
    private var helps: [HelpDetailViewModel] = []
    private var viewModel: HelpDetailsViewModelProtocol!
    
    init(tableView: UITableView, viewModel: HelpDetailsViewModelProtocol) {
        self.tableView = tableView
        
        super.init()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.viewModel = viewModel
    }
    
    func getHelpsList() {
        viewModel.fetchHelpList { [weak self] helps in
            DispatchQueue.main.async {
                self?.helps = helps
                self?.tableView.reloadData()
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        helps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(HelpDetailsCell.self, for: indexPath)
        cell.configure(with: helps[indexPath.row])
        return cell
    }
}

extension HelpDetailsDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let userId = "keth991102" // my friend's userId 😜
            
            guard let url = URL(string: "fb-messenger://user-thread/\(userId)") else { return }
            
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        
        if indexPath.row == 1 {
            guard let url = URL(string: "tel://\("+995574020223")") else { return } // its my phone number 😜
            
            let application:UIApplication = UIApplication.shared
            
            if (application.canOpenURL(url)) {
                application.open(url, options: [:], completionHandler: nil)
            }
        }
    }
}
