//
//  HelpDetailsViewModel.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 26.01.23.
//

import Foundation

protocol HelpDetailsViewModelProtocol: AnyObject {
    func fetchHelpList(completion: @escaping([HelpDetailViewModel]) -> Void)
    
    init(with helpManager: HelpManagerProtocol)
}

final class HelpDetailsViewModel: HelpDetailsViewModelProtocol {
    
    // MARK: - Private Properties
    
    private var helpManager: HelpManagerProtocol
    
    init(with helpManager: HelpManagerProtocol) {
        self.helpManager = helpManager
    }
    
    func fetchHelpList(completion: @escaping([HelpDetailViewModel]) -> Void) {
        
        helpManager.fetchHelps { offers in
            completion(offers.map { HelpDetailViewModel(help: $0)})
        }
    }
}
