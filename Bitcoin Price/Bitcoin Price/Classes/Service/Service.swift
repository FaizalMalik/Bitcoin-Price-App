//
//  Service.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 02/02/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
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
