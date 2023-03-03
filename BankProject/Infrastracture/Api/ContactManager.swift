//
//  ContactManager.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 25.01.23.
//

import UIKit
import Contacts

protocol ContactManagerProtocol: AnyObject {
    func fetchContacts(complition: @escaping ([Contact]) -> Void)
}

class ContactManager: ContactManagerProtocol {
    
    var contacts = [Contact]()
    
    func fetchContacts(complition: @escaping ([Contact]) -> Void) {
        
        let store = CNContactStore()
        
        store.requestAccess(for: .contacts) {
            (success, error) in
            success ? print("Success") : print("Error")
        }
        let keys = [CNContactGivenNameKey,
                   CNContactFamilyNameKey,
                   CNContactPhoneNumbersKey,
                   CNContactThumbnailImageDataKey]
        
        let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
        
        do {
            try store.enumerateContacts(with: request, usingBlock: { contact, result in
                let name = contact.givenName
                let lastname = contact.familyName
                let number = contact.phoneNumbers.first?.value.stringValue
                var numbers = [String]()
                for number in contact.phoneNumbers {
                    numbers.append(number.value.stringValue)
                }
                let firstSymbol = String(contact.givenName.prefix(1) + contact.familyName.prefix(1))
                let imageData = contact.thumbnailImageData
                let contactToAppend = Contact(name: name, lastName: lastname, number: number!, numbers: numbers, firstSymbol: firstSymbol, picture: imageData)
                contacts.append(contactToAppend)
            })
            
            complition(contacts)
            
        } catch {
            print("Error info: \(error)")
        }
    }
}
