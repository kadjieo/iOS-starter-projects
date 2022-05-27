//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    
    func didFailWithError(error: Error)
    
    func didGetCoinPrice(_ coinManager: CoinManager, coinModel: CoinModel)
}

struct CoinManager {
    
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "BE7BBA59-D768-423F-9CE6-BC72E5E2A345"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate: CoinManagerDelegate?
    
    func getCoinPrice(for currency: String) {
        let urlString = baseURL + "/\(currency)?apikey=\(apiKey)"
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let dataTask = session.dataTask(with: url) { (data, request, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let safeRate = parseJSON(safeData) {
                        delegate?.didGetCoinPrice(self, coinModel: CoinModel(rate: safeRate, currency: currency))
                    }
                }
            }
            dataTask.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> Double? {
        let decoder = JSONDecoder()
        do {
            let coinData = try decoder.decode(CoinData.self, from: data)
            return coinData.rate
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
