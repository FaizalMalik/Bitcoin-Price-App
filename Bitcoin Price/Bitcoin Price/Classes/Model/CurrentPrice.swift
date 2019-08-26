//
//  currentPrice.swift
//  BitcoinPrice
//
//  Created by Faizal on 26/08/19.
//  Copyright © 2019 Faizal . All rights reserved.
//

import Foundation

struct CurrentPrice {

    let date : String
    let bpi : PriceIndex

}

struct PriceIndex {
    let rate : String
    let rate_float : Float
    let code : String
    let symbol : String?
}

extension CurrentPrice : Parceable{
    static func parseObject(dictionary: [String : AnyObject]) -> Result<CurrentPrice, ErrorResult> {

        if let date = dictionary["time"]?["updated"] as? String,
            let bpi = dictionary["bpi"]?["USD"] as? [String: Any] {

            if let rate = bpi["rate"] as? String , let rate_float = bpi["rate_float"] as? Double , let code = bpi["code"] as? String  {

                let priceIndex : PriceIndex =  PriceIndex(rate: rate, rate_float: Float(rate_float), code: code, symbol: "$")

                let currentPrice = CurrentPrice(date: date, bpi: priceIndex)


            return Result.success(currentPrice)
                
            }
            else{
                return Result.failure(ErrorResult.parser(string: "Unable to parse CurrentPrice model"))
            
            }

        } else {
            return Result.failure(ErrorResult.parser(string: "Unable to parse CurrentPrice model"))
        }

    }



}



