//
//  NetworkDataFetcher.swift
//  BusinessLogic
//
//  Created by Ilya Latugovskii on 14.05.2020.
//  Copyright © 2020 Ilya Latugovskii. All rights reserved.
//

import Foundation

protocol DataFetcher {
    func getCurrency(response: @escaping ([Rate]?) -> ())
}
struct NetworkDataFetcher: DataFetcher {
    
    let networking: Networking
    
    init(networking: Networking) {
        self.networking = networking
    }
    
    func getCurrency(response: @escaping ([Rate]?) -> ()) {
        networking.request { (data, error) in
            if let error = error {
                print(error.localizedDescription)
                response(nil)
            }
            
            guard let decoded = try? JSONDecoder().decode([Rate].self, from: data!) else { return }
            response(decoded)
        }
    }
    
}
