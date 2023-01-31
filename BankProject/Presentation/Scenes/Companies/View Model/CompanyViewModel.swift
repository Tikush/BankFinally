//
//  CompanyViewModel.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 27.01.23.
//

import Foundation

struct CompanyViewModel {
    
    private var company: Companies
    
    init(company: Companies) {
        self.company = company
    }
    
    var imageUrl: String {
        company.picture ?? ""
    }

    var name: String {
        company.name ?? ""
    }
}
