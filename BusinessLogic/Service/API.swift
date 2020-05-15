//
//  API.swift
//  BusinessLogic
//
//  Created by Ilya Latugovskii on 14.05.2020.
//  Copyright © 2020 Ilya Latugovskii. All rights reserved.
//

import Foundation

struct API {
    static let sсheme = "https"
    static let host = "www.nbrb.by"
    static let newsFeed = "/api/exrates/rates"
    static let periodicity = "0"
    
    static let ondate = ""
    static let parammode = ""
}

public protocol Currency {
    var curName: String { get }
    var curOfficialRate: Double { get }
}

struct Rate: Codable, Currency {
    public var curName: String
    public var curOfficialRate: Double
    
    private enum CodingKeys: String, CodingKey {
        case curName = "Cur_Name"
        case curOfficialRate = "Cur_OfficialRate"
        
    }
}
