//
//  HomeViewModel.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 24.01.23.
//

import Foundation

protocol HomeViewModelProtocol: AnyObject {
    
    var controller: CoordinatorDelegate { get }
    
    init(with controller: CoordinatorDelegate)
}

final class HomeViewModel: HomeViewModelProtocol {
    
    // MARK: - Private Properties
    
    private(set) var controller: CoordinatorDelegate
    
    init(with controller: CoordinatorDelegate) {
        self.controller = controller
    }
}
