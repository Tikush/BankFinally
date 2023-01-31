//
//  PaySuccessViewModel.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 28.01.23.
//

import Foundation

protocol PaySuccessViewModelProtocol: AnyObject {
    
    var coordinator: CoordinatorProtocol { get }
    
    init(with coordinator: CoordinatorProtocol)
}

final class PaySuccessViewModel: PaySuccessViewModelProtocol {
    
    // MARK: - Private Properties
    
    private(set) var coordinator: CoordinatorProtocol
    
    init(with coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
    }
}
