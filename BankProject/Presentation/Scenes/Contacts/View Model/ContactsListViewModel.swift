//
//  ContactsListViewModel.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 25.01.23.
//

import Foundation

protocol ContactsListViewModelProtocol: AnyObject {
    
    var controller: CoordinatorDelegate { get }
    
    func fetchContacts(complition: @escaping ([ContactViewModel]) -> Void)
    init(with controller: CoordinatorDelegate, contactManager: ContactManagerProtocol)
}

final class ContactsListViewModel: ContactsListViewModelProtocol {
    
    // MARK: - Private Properties
    
    private var contactManager: ContactManagerProtocol
    private(set) var controller: CoordinatorDelegate
    
    init(with controller: CoordinatorDelegate, contactManager: ContactManagerProtocol) {
        self.contactManager = contactManager
        self.controller = controller
    }
    
    func fetchContacts(complition: @escaping ([ContactViewModel]) -> Void) {
        contactManager.fetchContacts { contacts in
            complition(contacts.map{ContactViewModel(contact: $0)})
        }
    }
}
