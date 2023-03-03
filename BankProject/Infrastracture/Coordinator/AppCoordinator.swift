//
//  AppCoordinator.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 16.01.23.
//

import UIKit

final class AppCoordinator: CoordinatorProtocol {
    
    // MARK: - Private Properties
    private var window: UIWindow?
    private var navigationController: UINavigationController?
    
    init(_ window: UIWindow?, navigationController: UINavigationController?) {
        self.window = window
        self.navigationController = navigationController
    }
    
    //    func start() {
    //        let vc = WellcomeViewController.instantiateFromStoryboard()
    //        vc.coordinator = self
    //        navigationController?.pushViewController(vc, animated: true)
    //
    //        window?.rootViewController = navigationController
    //        window?.makeKeyAndVisible()
    //    }
    
    func start() { // Temporery For load Tab Bar
        let vc = MainTabBarViewController.instantiateFromStoryboard()
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: false)
        navigationController?.isNavigationBarHidden = true
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func logIn(with controller: UIViewController) {
        let vc = LoginViewController.instantiateFromStoryboard()
        vc.coordinator = self
        vc.modalPresentationStyle = .fullScreen
        controller.present(vc, animated: true)
    }
    
    func register(with controller: UIViewController) {
        let vc = RegisterViewController.instantiateFromStoryboard()
        vc.coordinator = self
        vc.modalPresentationStyle = .fullScreen
        controller.present(vc, animated: true)
    }
    
    func main() {
        let vc = MainTabBarViewController.instantiateFromStoryboard()
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: false)
        navigationController?.isNavigationBarHidden = true
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

