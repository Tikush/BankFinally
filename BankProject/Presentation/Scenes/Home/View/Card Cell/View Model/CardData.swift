//
//  CardData.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 28.01.23.
//

import UIKit

class CardData {
    
    // MARK: - Card data
    
    var data: [Card] = [
        Card(title: "My Card", image: UIImage(named: "ic_stu"), content: "MS Standard", amount: "77.775.57"),
        Card(title: "TBC for BUSINESS", image: UIImage(named: "ic_stu"), content: "VISA", amount: "7871.12"),
        Card(title: "TBC CARD", image: UIImage(named: "ic_tbc 1"), content: "VISA", amount: "5777.35")
    ]
}
