//
//  InviteDetailsViewModek.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 24.01.23.
//

import UIKit

protocol InviteDetailsViewModelProtocol: AnyObject {
    
    var controller: CoordinatorDelegate { get }
    init(controller: CoordinatorDelegate)
    
    func openActivitySheet()
}

final class InviteDetailsViewModel: InviteDetailsViewModelProtocol {
    
    // MARK: - Private Properties
    
    private(set) var controller: CoordinatorDelegate
    private var navigationController: UINavigationController?
    
    init(controller: CoordinatorDelegate) {
        self.controller = controller
    }
    
    func openActivitySheet() {
        let ac = UIActivityViewController(activityItems: ["Download the app and use my code Qer2FJD: https://link.bankproject.ge"], applicationActivities:  nil)
        ac.completionWithItemsHandler = { (nil, completed, _, error) in
            completed ? print("Completed") : print("Cencalled")
        }
        controller.present(ac, animated: true) {
            print("Presented")
        }
    }
}
