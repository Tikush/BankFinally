//
//  PayViewModel.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 23.01.23.
//

import Foundation

protocol PayViewModelProtocol: AnyObject {
    
    var coordinator: CoordinatorProtocol { get }
    
    init(with coordinator: CoordinatorProtocol)
}

final class PayViewModel: PayViewModelProtocol {
    
    private(set) var coordinator: CoordinatorProtocol
    
    init(with coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
    }
}
