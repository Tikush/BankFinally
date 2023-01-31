//
//  NetworkManager.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 21.01.23.
//

import Foundation

enum EndPoint: String {
    case payment = "https://mocki.io/v1/50ca66c7-07a5-4ac9-9231-88b3cd03a48f"
    case offer = "https://mocki.io/v1/3b7d46a3-8f22-484e-a9af-cd5dd24b0c60"
    case help = "https://mocki.io/v1/603d97c6-24a0-4963-a8c5-09a8aa7365f8"
}

protocol NetworkManagerProtocol: AnyObject {
    
    func get<T: Codable>(with url: String, completion: @escaping(Result<T, Error>) -> Void)
}

class NetworkManager: NetworkManagerProtocol {
    
    func get<T: Codable>(with url: String, completion: @escaping (Result<T, Error>) -> Void) {
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error {
                completion(.failure(error))
            }
            
            guard let data = data else { return }
            
            do {
                let decoder = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decoder))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
