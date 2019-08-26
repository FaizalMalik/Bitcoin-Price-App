//
//  Service.swift
//  BitcoinPrice
//
//  Created by Faizal on 26/08/19.
//  Copyright © 2019 Faizal . All rights reserved.
//

import Foundation

protocol Parceable {
    static func parseObject(dictionary: [String: AnyObject]) -> Result<Self, ErrorResult>
}

class ParseService<T: Parceable> {

    // MARK: - Variables

    
    // MARK: - Public

    func jsonParse(data: Data) -> T? {
        do {
           
            if let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: AnyObject] {
                
                // check foreach dictionary if parseable
                switch T.parseObject(dictionary: dictionary) {
                case .failure( _):
                    return nil
                case .success(let newModel):
                   return newModel
          
                }
                
           }
            
            
        } catch {
            return nil
        }
        
        return nil
    }


    
}

enum ServiceFailureType {
    case connection
    case server
}
