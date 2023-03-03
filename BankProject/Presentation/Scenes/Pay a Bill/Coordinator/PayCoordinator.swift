//
//  PayCoordinator.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 20.01.23.
//

import UIKit

final class PayCoordinator: CoordinatorProtocol {
    
    var networkManager: NetworkManagerProtocol?
    var paymentManager: PaymentManagerProtocol?
    
    var navigationController: UINavigationController?
    
    init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
        
        self.navigationController = navigationController
        self.navigationController?.isNavigationBarHidden = true

        let vc = PayViewController.instantiateFromStoryboard()
        vc.coordinator = self
        
        vc.tabBarItem.image = UIImage(named: "ic_payment")
        
        networkManager = NetworkManager()
        
        paymentManager = PaymentManager(with: networkManager!)

        self.navigationController?.viewControllers = [vc]
    }
    
    func goToCategories() {
        let vc = CategoriesListViewController.instantiateFromStoryboard()
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToCompanies(with name: String) {
        let vc = CompaniesListViewController.instantiateFromStoryboard()
        vc.coordinator = self
        vc.categoryName = name
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToCompanyDetails(with name: String, imageUrl: String) {
        let vc = CompanyDetailsViewController.instantiateFromStoryboard()
        vc.coordinator = self
        vc.companyName = name
        vc.imageUrl = imageUrl
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToPayDetails(with name: String, image: UIImage) {
        let vc = PayDetailsViewController.instantiateFromStoryboard()
        vc.coordinator = self
        vc.companyName = name
        vc.image = image
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToPaySuccess() {
        let vc = PaySuccessController.instantiateFromStoryboard()
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
    }
}
