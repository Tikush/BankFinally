//
//  ContactViewModel.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 25.01.23.
//

import UIKit

struct ContactViewModel {
    
    private var contact: Contact
    
    init(contact: Contact) {
        self.contact = contact
    }
    
    var image: UIImage? {
        if let picture = contact.picture {
            return UIImage(data: picture)
        } else {
            return nil
        }
    }
    
    var fullName: String? {
        "\(contact.name) \(contact.lastName)"
    }
    
    var phoneNumbers: String? {
        contact.number ?? ""
    }
    
    var firstSymbol: String {
        contact.symbol
    }
}
