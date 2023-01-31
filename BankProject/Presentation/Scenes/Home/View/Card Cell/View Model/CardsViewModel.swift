//
//  CardViewModel.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 28.01.23.
//

import Foundation

protocol CardsViewModelProtocol: AnyObject {
    var coordinator: CoordinatorProtocol { get }
    
    init(with coordinator: CoordinatorProtocol)
}

final class CardsViewModel: CardsViewModelProtocol {
    
    // MARK: - Private Properties
    
    private(set) var coordinator: CoordinatorProtocol
    
    init(with coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
    }
}
