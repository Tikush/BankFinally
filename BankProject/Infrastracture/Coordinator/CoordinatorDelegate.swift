//
//  CoordinatorDelegate.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 16.01.23.
//

import UIKit

protocol CoordinatorDelegate: UIViewController {
    
    var coordinator: CoordinatorProtocol? { get set }
}
