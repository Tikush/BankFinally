//
//  CoordinatorProtocol.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 16.01.23.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    
    var networkManager: NetworkManagerProtocol? { get }
    var paymentServicesManager: PaymentManagerProtocol? { get }
    
    init(_ window: UIWindow?, navigationController: UINavigationController?)
    
    func start()
    func logIn(with controller: UIViewController)
    func register(with controller: UIViewController)
    func main()

    func goToCategories()
    func goToCompanies(with: String)
    func goToCompanyDetails(with name: String, imageUrl: String)
    func goToPayDetails(with name: String, image: UIImage)
    func goToPaySuccess()
        
    func goToHelpDetails()
    func goToInviteDetails()
    func goToContacts()
    
    func goToOfferDetails(with index: Int, offer: OfferViewModel)
}

// MARK: Default Implementetion

extension CoordinatorProtocol {
    
    var networkManager: NetworkManagerProtocol? {
        get { nil }
        set { print("") }
    }
    
    var paymentServicesManager: PaymentManagerProtocol? {
        get { nil }
        set { print("") }
    }
    
    func start() {}
    func logIn(with controller: UIViewController) {}
    func register(with controller: UIViewController) {}
    func main() {}
    
    func goToCategories() {}
    func goToCompanies(with: String) {}
    func goToCompanyDetails(with name: String, imageUrl: String) {}
    func goToPayDetails(with name: String, image: UIImage) {}
    func goToPaySuccess() {}
    
    func goToHelpDetails() {}
    func goToInviteDetails() {}
    func goToContacts() {}
    
    func goToOfferDetails(with index: Int, offer: OfferViewModel) {}
}

