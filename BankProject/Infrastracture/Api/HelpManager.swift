//
//  HelpManager.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 26.01.23.
//

protocol HelpManagerProtocol: AnyObject {
    func fetchHelps(completion: @escaping([Help]) -> Void)
    
    init(with networkManager: NetworkManagerProtocol)
}

final class HelpManager: HelpManagerProtocol {
    
    // MARK: - Private Properties
    
    private var networkManager: NetworkManagerProtocol
    
    init(with networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func fetchHelps(completion: @escaping([Help]) -> Void) {
        networkManager.get(with: EndPoint.help.rawValue) { (result: Result<[Help], Error>) in
            
            switch result {
            case .success(let helps):
                completion(helps)
            case .failure(let error):
                print(error)
            }
        }
    }
}
