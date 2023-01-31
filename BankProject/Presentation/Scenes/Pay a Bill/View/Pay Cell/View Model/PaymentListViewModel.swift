//
//  PayViewModel.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 20.01.23.
//

import UIKit

protocol PaymentListViewModelProtocol: AnyObject {
    
    var coordinator: CoordinatorProtocol { get }
    init(with paymentManager: PaymentManagerProtocol, coordinator: CoordinatorProtocol)
    
    func fetchCategoriesOfPayment(completion: @escaping([PaymentViewModel]) -> Void)
}

final class PaymentListViewModel: PaymentListViewModelProtocol {
    
    private(set) var coordinator: CoordinatorProtocol
    
    // MARK: - Private Properties
    
    private var paymentManager: PaymentManagerProtocol!
        
    init(with paymentManager: PaymentManagerProtocol, coordinator: CoordinatorProtocol) {
        self.paymentManager = paymentManager
        self.coordinator = coordinator
    }
    
    func fetchCategoriesOfPayment(completion: @escaping([PaymentViewModel]) -> Void) {
        paymentManager.fetchCategories { categories in
            completion(categories.map {
                PaymentViewModel(category: $0)
            })
        }
    }
}

