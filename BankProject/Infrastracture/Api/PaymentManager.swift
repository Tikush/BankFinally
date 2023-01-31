//
//  PaymentManager.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 21.01.23.
//

import Foundation

protocol PaymentManagerProtocol: AnyObject {
    
    func fetchCompanies(completion: @escaping([Companies]) -> Void)
    func fetchCompaniesIDs(categoryName: String, complation: @escaping ([Int]) -> Void)
    
    func fetchCategories(completion: @escaping([Categories]) -> Void)
    
    init(with networkManager: NetworkManagerProtocol)
}

final class PaymentManager: PaymentManagerProtocol {
   
    // MARK: - Private Properties
    
    private var networkManager: NetworkManagerProtocol!
    
    init(with networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func fetchCategories(completion: @escaping([Categories]) -> Void) {
        
        networkManager.get(with: EndPoint.payment.rawValue) { (result: Result<Payment, Error>) in
            switch result {
            case .success(let payment):
                completion(payment.data.categories)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchCompanies(completion: @escaping([Companies]) -> Void) {
        
        networkManager.get(with: EndPoint.payment.rawValue) { (result: Result<Payment, Error>) in
            switch result {
            case .success(let payment):
                completion(payment.data.companies)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchCompaniesIDs(categoryName: String, complation: @escaping ([Int]) -> Void) {
        
        networkManager.get(with: EndPoint.payment.rawValue) { (result: Result<Payment, Error>) in
            switch result {
            case .success(let categories):
            
                categories.data.categories.forEach {
                    if categoryName == $0.name {
                        complation($0.companyIds ?? [])
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
