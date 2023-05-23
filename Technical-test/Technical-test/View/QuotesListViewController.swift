//
//  QuotesListViewController.swift
//  Technical-test
//
//  Created by Patrice MIAKASSISSA on 29.04.21.
//

import UIKit

class QuotesListViewController: UIViewController {
    
    private let dataManager:DataManager = DataManager()
    private var market:Market? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            do {
                market = Market()
                let quotes = try await dataManager.fetchQuotes()
                market?.quotes = quotes.map { quote -> Quote in
                    var updatedQuote = quote
                    updatedQuote.myMarket = market
                    return updatedQuote
                }
                print(market?.quotes ?? "Market not found")

            } catch {
                print("Error fetching quotes: \(error)")
            }
        }
    }
}
