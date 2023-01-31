//
//  OfferManager.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 23.01.23.
//

protocol OfferManagerProtocol: AnyObject {
    func fetchOffers(completion: @escaping([Offer]) -> Void)
    
    init(with networkManager: NetworkManagerProtocol)
}

final class OfferManager: OfferManagerProtocol {
    
    // MARK: - Private Properties
    
    private var networkManager: NetworkManagerProtocol
    
    init(with networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func fetchOffers(completion: @escaping ([Offer]) -> Void) {
        networkManager.get(with: EndPoint.offer.rawValue) { (result: Result<[Offer], Error>) in
            
            switch result {
            case .success(let offers):
                completion(offers)
            case .failure(let error):
                print(error)
            }
        }
    }
}
