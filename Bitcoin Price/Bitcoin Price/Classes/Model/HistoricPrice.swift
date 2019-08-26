//
//  MarketPrice.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 27/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import Foundation


struct HistoricPrice {
    
    let values: [ChartValues]
    
    
}

struct ChartValues {
    let date:String
    let rate:Float
}

extension HistoricPrice : Parceable {
    static func parseObject(dictionary: [String : AnyObject]) -> Result<HistoricPrice, ErrorResult> {
        
        if let bpi = dictionary["bpi"] as? [String: Double] {
            
            
            let chartValues : [ChartValues] = bpi.compactMap({ ChartValues(date: $0.key, rate:Float($0.value) ) })

            let historyPrices = HistoricPrice(values: chartValues)
            
            return Result.success(historyPrices)
            
        } else {
            return Result.failure(ErrorResult.parser(string: "Unable to parse conversion rate"))
        }

    }
    
    
}
