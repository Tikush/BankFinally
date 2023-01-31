//
//  HelpViewModel.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 24.01.23.
//

import Foundation

protocol HelpViewModelProtocol: AnyObject {
    var coordinator: CoordinatorProtocol { get }
    
    init(with coordinator: CoordinatorProtocol)
}

final class HelpViewModel: HelpViewModelProtocol {
    
    // MARK: - Private Properties
    
    private(set) var coordinator: CoordinatorProtocol
    
    init(with coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
    }
}
