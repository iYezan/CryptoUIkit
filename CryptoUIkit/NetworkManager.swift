//
//  NetworkManager.swift
//  CryptoUIkit
//
//  Created by iYezan on 21/01/2022.
//

import Foundation

class NetworkManager {
    static let shared  = NetworkManager()
    let baseURL        = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h"
    
    private init() {}
    
    func getCoins(completed: @escaping (Result<[CoinData], CError>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completed(.failure(.invalidData))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completed(.failure(.unableToComplete))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode([CoinData].self, from: data)
                completed(.success(decodedResponse))
                
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
