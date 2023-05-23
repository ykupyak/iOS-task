//
//  DataManager.swift
//  Technical-test
//
//  Created by Patrice MIAKASSISSA on 29.04.21.
//

import Foundation


class DataManager {
    
    private static let path = "https://www.swissquote.ch/mobile/iphone/Quote.action?formattedList&formatNumbers=true&listType=SMI&addServices=true&updateCounter=true&&s=smi&s=$smi&lastTime=0&&api=2&framework=6.1.1&format=json&locale=en&mobile=iphone&language=en&version=80200.0&formatNumbers=true&mid=5862297638228606086&wl=sq"
    
    enum DataManagerError: Error {
        case invalidURL
        case networkError(Error)
        case decodingError(Error)
    }

    func fetchQuotes() async throws -> [Quote] {
        guard let url = URL(string: DataManager.path) else {
            throw DataManagerError.invalidURL
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedData = try JSONDecoder().decode([Quote].self, from: data)
            return decodedData
        } catch {
            throw DataManagerError.networkError(error)
        }
    }
}

