//
//  TransferViewModel.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 25.01.23.
//

import Foundation

protocol TransferViewModelProtocol: AnyObject {
 
    var controller: CoordinatorDelegate { get }
    
    init(with controller: CoordinatorDelegate)
}

final class TransferViewModel: TransferViewModelProtocol {
    
    private(set) var controller: CoordinatorDelegate
    
    init(with controller: CoordinatorDelegate) {
        self.controller = controller
    }
}
