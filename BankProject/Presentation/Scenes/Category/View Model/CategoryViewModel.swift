//
//  CategoryViewModel.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 23.01.23.
//

struct CategoryViewModel {
    
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
