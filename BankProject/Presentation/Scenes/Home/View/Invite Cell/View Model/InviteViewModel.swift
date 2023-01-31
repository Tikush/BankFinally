//
//  InviteViewModel.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 24.01.23.
//

import Foundation

protocol InviteViewModelProtocol: AnyObject {
    var coordinator: CoordinatorProtocol { get }
    
    init(with coordinator: CoordinatorProtocol)
}

final class InviteViewModel: InviteViewModelProtocol {
    
    // MARK: - Private Properties
    
    private(set) var coordinator: CoordinatorProtocol
    
    init(with coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
    }
}
