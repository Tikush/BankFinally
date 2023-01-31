//
//  CompaniesListViewModel.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 27.01.23.
//

import UIKit

protocol CompaniesListViewModelProtocol: AnyObject {
    
    func fetchIDs()
    func fetchCompanies(completion: @escaping([CompanyViewModel]) -> Void)
    
    init(with paymentManager: PaymentManagerProtocol, controller: CoordinatorDelegate, navigationController: UINavigationController?, categoryName: String)
    var controller: CoordinatorDelegate { get }
}

final class CompaniesListViewModel: CompaniesListViewModelProtocol {
    
    var controller: CoordinatorDelegate
    
    //MARK: - Private Properties
    
    private var paymentManager: PaymentManagerProtocol
    private var navigationController: UINavigationController?
    private var categoryName: String
    private var ids: [Int] = []
    
    init(with paymentManager: PaymentManagerProtocol, controller: CoordinatorDelegate, navigationController: UINavigationController?, categoryName: String) {
        
        self.paymentManager = paymentManager
        self.controller = controller
        self.navigationController = navigationController
        self.categoryName = categoryName
    }
    
    func fetchIDs() {
        paymentManager.fetchCompaniesIDs(categoryName: categoryName) { [weak self] in
            self?.ids = $0
        }
    }
    
    func fetchCompanies(completion: @escaping([CompanyViewModel]) -> Void) {
        
        var companiesList: [Companies] = []
        
        paymentManager.fetchCompanies { [weak self] companies in
            
            companies.forEach { company in
                self?.ids.forEach { id in
                    if company.companyId == id {
                        companiesList.append(company)
                    }
                }
            }
            
            completion(companiesList.map {
                CompanyViewModel(company: $0)
            })
        }
    }
}
