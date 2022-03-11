//
//  CoinData.swift
//  CryptoUIkit
//
//  Created by iYezan on 21/01/2022.
//

import Foundation

struct Coin: Decodable {
    let id: String
    let name: String
    let currentPrice: Double

    enum CodingKeys: String, CodingKey {
        case id, name
        case currentPrice = "current_price"
    }
}


//struct Coin  {
//    let name: String
//    let price: Double
//
//}
//
//
//extension Coin {
//    static let getCoin = [ Coin(name: "BTC",
//                                price: 40000),
//                           Coin(name: "CEL",
//                                price: 10)
//    ]
//}
