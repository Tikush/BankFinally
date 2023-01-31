//
//  Category.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 21.01.23.
//

import Foundation

struct Payment: Codable {
    let data: Data
    
    struct Data: Codable {
        let categories: [Categories]
        let companies: [Companies]
    }
}

struct Categories: Codable {
    let name: String?
    let picture: String?
    let companyIds: [Int]?
}

struct Companies: Codable {
    let name: String?
    let picture: String?
    let companyId: Int?
}
