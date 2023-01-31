//
//  CategoriesListViewModel.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 22.01.23.
//

import UIKit

protocol CategoriesListViewModelProtocol: AnyObject {
    
    func fetchCategories(compeltion: @escaping([CategoryViewModel]) -> Void)
    
    init(with paymentManager: PaymentManagerProtocol, controller: CoordinatorDelegate, navigationController: UINavigationController?)
    var controller: CoordinatorDelegate { get }
}

final class CategoriesListViewModel: CategoriesListViewModelProtocol {
    
    var controller: CoordinatorDelegate
    
    //MARK: - Private Properties
    
    private var paymentManager: PaymentManagerProtocol
    private var navigationController: UINavigationController?
    
    init(with paymentManager: PaymentManagerProtocol, controller: CoordinatorDelegate, navigationController: UINavigationController?) {
        self.paymentManager = paymentManager
        self.controller = controller
        self.navigationController = navigationController
    }
    
    func fetchCategories(compeltion: @escaping([CategoryViewModel]) -> Void) {
        paymentManager.fetchCategories { categories in
            compeltion(categories.map {
                CategoryViewModel(category: $0)
            })
        }
    }
}
