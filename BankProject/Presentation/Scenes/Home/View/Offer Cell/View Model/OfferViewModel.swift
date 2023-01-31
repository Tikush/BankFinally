//
//  OfferViewModel.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 27.01.23.
//

import Foundation

class OfferViewModel {
    
    // MARK: - Private Properties
    
    private var offer: Offer
    
    init(offer: Offer) {
        self.offer = offer
    }
    
    var imageUrl: String {
        offer.imageUrl ?? ""
    }
    
    var title: String {
        offer.title ?? ""
    }
    
    var content: String {
        offer.content ?? ""
    }
    
    var webUrl: URL? {
        URL(string: offer.urlWeb ?? "")
    }
}
