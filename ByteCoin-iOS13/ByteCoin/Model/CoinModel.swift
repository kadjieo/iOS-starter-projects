//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Dara Khadjehnouri on 2022-04-29.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel {
    
    let rate: Double
    
    let currency: String
    
    var rateString: String {
        String(format: "%.2f", rate)
    }
}
