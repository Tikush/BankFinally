//
//  PaymentViewModel.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 21.01.23.
//


struct PaymentViewModel {
    
    private var category: Categories
    
    init(category: Categories) {
        self.category = category
    }
    
    var imageUrl: String {
        category.picture ?? ""
    }
    
    var name: String {
        category.name ?? ""
    }
}
