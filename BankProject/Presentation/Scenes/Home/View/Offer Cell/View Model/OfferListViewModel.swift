//
//  OfferListViewModel.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 23.01.23.
//

import Foundation

protocol OfferListViewModelProtocol: AnyObject {
    
    var coordinator: CoordinatorProtocol { get }
    init(with coordinator: CoordinatorProtocol, offerManager: OfferManagerProtocol)
    
    func fetchOfferList(completion: @escaping([OfferViewModel]) -> Void)
    
}

final class OfferListViewModel: OfferListViewModelProtocol {
    
    // MARK: - Private Properties
    
    private var offerManager: OfferManagerProtocol
    private(set) var coordinator: CoordinatorProtocol
    
    init(with coordinator: CoordinatorProtocol, offerManager: OfferManagerProtocol) {
        self.offerManager = offerManager
        self.coordinator = coordinator
    }
    
    func fetchOfferList(completion: @escaping ([OfferViewModel]) -> Void) {
        offerManager.fetchOffers { offers in
            completion(offers.map { OfferViewModel(offer: $0) })
        }
    }
}
