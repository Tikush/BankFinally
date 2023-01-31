//
//  CompanyDetailsViewModel.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 28.01.23.
//

import Foundation

protocol CompanyDetailsViewModelProtocol: AnyObject {
    
    var coordinator: CoordinatorProtocol { get }
    
    init(with coordinator: CoordinatorProtocol)
}

final class CompanyDetailsViewModel: CompanyDetailsViewModelProtocol {
    
    // MARK: - Private Properties
    
    private(set) var coordinator: CoordinatorProtocol
    
    init(with coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
    }
}
