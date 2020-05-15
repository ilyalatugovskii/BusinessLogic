//
//  NetworkService.swift
//  BusinessLogic
//
//  Created by Ilya Latugovskii on 14.05.2020.
//  Copyright © 2020 Ilya Latugovskii. All rights reserved.
//

import Foundation

protocol Networking {
    func request(completion: @escaping (Data?, Error?) -> Void)
}

class NetworkService: Networking {

    func request(completion: @escaping (Data?, Error?) -> Void) {
    
        var allParams: [String: String] = [:]
        allParams["periodicity"] = API.periodicity
        
        let url = self.url(params: allParams)
        let request = URLRequest(url: url)
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> ()) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { (data, responce, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
    
    private func url(params: [String: String]) -> URL {
        var components = URLComponents()
        
        components.scheme = API.sсheme
        components.host = API.host
        components.path = API.newsFeed
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1) }
        
        return components.url!
    }
}
