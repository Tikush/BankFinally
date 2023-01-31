//
//  TransferCoordinator.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 16.01.23.
//

import UIKit

final class TransferCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController?
    
    init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
        
        self.navigationController = navigationController
        self.navigationController?.isNavigationBarHidden = true

        let vc = TransferViewController.instantiateFromStoryboard()
        vc.coordinator = self
        
        vc.tabBarItem.image = UIImage(named: "ic_transfer")

        self.navigationController?.viewControllers = [vc]
    }
}
