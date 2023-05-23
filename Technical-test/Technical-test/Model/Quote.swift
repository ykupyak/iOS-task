//
//  Quote.swift
//  Technical-test
//
//  Created by Patrice MIAKASSISSA on 29.04.21.
//

import Foundation

struct Quote: Decodable {
    var symbol:String?
    var name:String?
    var currency:String?
    var readableLastChangePercent:String?
    var last:String?
    var variationColor:String?
    var myMarket:Market?


    private enum CodingKeys: String, CodingKey {
        case symbol
        case name
        case currency
        case readableLastChangePercent
        case last
        case variationColor
    }
}
