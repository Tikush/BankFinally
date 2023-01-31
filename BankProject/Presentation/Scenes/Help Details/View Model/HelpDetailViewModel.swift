//
//  HelpDetailViewModel.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 26.01.23.
//

import Foundation

struct HelpDetailViewModel {
    
    // MARK: - Private Properties
    
    private var help: Help
    
    init(help: Help) {
        self.help = help
    }
    
    var title: String {
        help.title ?? ""
    }
    
    var imageUrl: String {
        help.imageUrl ?? ""
    }
}
