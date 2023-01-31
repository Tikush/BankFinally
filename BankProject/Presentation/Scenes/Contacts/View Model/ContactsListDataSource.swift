//
//  ContactsListDataSource.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 25.01.23.
//

import UIKit
import MessageUI

class ContactsListDataSource: NSObject, UITableViewDataSource {
    
    // MARK: - Private Properties
    
    private var tableView: UITableView!
    private var viewModel: ContactsListViewModelProtocol!
    private var contacts: [ContactViewModel] = []
    
    init(tableView: UITableView, viewModel: ContactsListViewModelProtocol) {
        self.tableView = tableView
        
        super.init()
        self.tableView.dataSource = self
        
        self.viewModel = viewModel
    }
    
    func getContacts() {
        viewModel.fetchContacts { [weak self] contacts in
            self?.contacts = contacts
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(ContactCell.self, for: indexPath)
        cell.configute(with: contacts[indexPath.row])
        cell.delegate = self
        return cell
    }
}

// MARK: - ContactDelegate

extension ContactsListDataSource: ContactDelegate {
    func sendMessage(with phone: String) {
        if(MFMessageComposeViewController.canSendAttachments()) {
            let vc = MFMessageComposeViewController()
            vc.body = "Download the app and use my code Qer2FJD: https://link.bankproject.ge"
            vc.recipients = [phone]
            vc.messageComposeDelegate = self
            viewModel.controller.present(vc, animated: true, completion: nil)
        } else {
            print("sent massage to number")
        }
    }
}

// MARK: - MFMessageComposeViewControllerDelegate

extension ContactsListDataSource: MFMessageComposeViewControllerDelegate {
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch result {
        case .cancelled:
            print("Cencalled")
            viewModel.controller.dismiss(animated: true, completion: nil)
        case .failed:
            print("Failed")
            viewModel.controller.dismiss(animated: true, completion: nil)
        case .sent:
            print("Sent")
            viewModel.controller.dismiss(animated: true, completion: nil)
        default:
            break
        }
    }
}
