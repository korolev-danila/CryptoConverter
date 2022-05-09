//
//  ConversionResponseModel.swift
//  CryptoConverter
//
//  Created by Данила on 07.05.2022.
//

import Foundation

struct ConversionResponseModel: Decodable {
    typealias DestinationCurrency = String
    
    let currency : DestinationCurrency
    let value : Double
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let dict = try container.decode([String:Double].self)
        guard let key = dict.keys.first else {
            throw NSError(domain: "Decoder", code: 0, userInfo: [:])
        }
        currency = key
        value = dict[key] ?? -1.0
    }
}
