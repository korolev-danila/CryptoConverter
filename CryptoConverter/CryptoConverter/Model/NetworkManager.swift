//
//  NetworkManager.swift
//  CryptoConverter
//
//  Created by Данила on 07.05.2022.
//

import Foundation
import Alamofire

class NetworkManager {    
    func fetchDataWithAlamofire(tickerOne: String, tickerTwo: String,_ completion: @escaping(ConversionResponseModel?) -> Void) {
        AF.request("https://min-api.cryptocompare.com/data/price?fsym=\(tickerOne)&tsyms=\(tickerTwo)").responseData { response in
            guard let data = response.data else { return }
            
            switch response.result {
            case .success(_):
                    let myResult = try? JSONDecoder().decode(ConversionResponseModel.self, from: data)
                    completion(myResult)
            case .failure(let error):
                print("Request error: \(error)")
                completion(nil)
            }
        }
    }
}



