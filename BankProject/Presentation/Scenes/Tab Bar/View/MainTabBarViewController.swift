//
//  MainTabBarViewController.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 16.01.23.
//

import UIKit

class MainTabBarViewController: UITabBarController, Storyboarded, CoordinatorDelegate {
    
    // MARK: - Private Properties
    
    private var homeCoordinator = HomeCoordinator()
//    private var transferCoordinator = TransferCoordinator()
    private var payCoordinator = PayCoordinator()
    
    // MARK: - Internal Properties
    
    var coordinator: CoordinatorProtocol?
    
    // MARK: - Life Cyrcle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setVC()
        setupLayout()
    }
    
    private func setupLayout() {
        tabBar.backgroundColor = Constants.Color.navyBlue
        tabBar.tintColor = Constants.Color.brandBlue
    }
    
    private func setVC() {
        viewControllers = [
            homeCoordinator.navigationController!,
            payCoordinator.navigationController!
//            transferCoordinator.navigationController!
        ]
    }
}
