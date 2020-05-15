//
//  BusinessLogic.swift
//  BusinessLogic
//
//  Created by Ilya Latugovskii on 14.05.2020.
//  Copyright © 2020 Ilya Latugovskii. All rights reserved.
//

import Foundation

public class BusinessLogic {
    public static var shared = BusinessLogic()
    
    private init() {}
    private var dataFetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
    
    public var currencies: [Currency] = []
    
    public func makeRequestForData(closure: @escaping () -> ()) {
        dataFetcher.getCurrency { [weak self] (rates) in
            guard let rates = rates else { return }
            self?.currencies = rates
            closure()
        }
    }
    
    public func swapInCurrencies(sourceIndexPathRow: Int, destinationIndexPathRow: Int) {
        let item = currencies[sourceIndexPathRow]
        currencies.remove(at: sourceIndexPathRow)
        currencies.insert(item, at: destinationIndexPathRow)
    }
    
}

