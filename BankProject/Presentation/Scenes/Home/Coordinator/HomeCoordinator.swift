//
//  HomeCoordinator.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 16.01.23.
//

import UIKit

final class HomeCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController?
    
    init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
        
        self.navigationController = navigationController
        self.navigationController?.isNavigationBarHidden = true

        let vc = HomeViewController.instantiateFromStoryboard()
        vc.coordinator = self
        
        vc.tabBarItem.image = UIImage(named: "ic_home")

        self.navigationController?.viewControllers = [vc]
    }
    
    func goToHelpDetails() {
        let vc = HelpDetailsViewController.instantiateFromStoryboard()
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToInviteDetails() {
        let vc = InviteDetailsViewController.instantiateFromStoryboard()
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToContacts() {
        let vc = ContactsListViewController.instantiateFromStoryboard()
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToOfferDetails(with index: Int, offer: OfferViewModel) {
        let vc = OfferDetailsController.instantiateFromStoryboard()
        vc.coordinator = self
        vc.indexPath = index
        vc.offer = offer
        navigationController?.present(vc, animated: true)
    }
}
