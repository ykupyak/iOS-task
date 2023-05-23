//
//  QuotesListViewController.swift
//  Technical-test
//
//  Created by Patrice MIAKASSISSA on 29.04.21.
//

import UIKit

class QuotesListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private let dataManager: DataManager = DataManager()
    private var market: Market? = nil
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()

        Task {
            do {
                market = Market()
                let quotes = try await dataManager.fetchQuotes()
                market?.quotes = quotes.map { quote -> Quote in
                    var updatedQuote = quote
                    updatedQuote.myMarket = market
                    return updatedQuote
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("Error fetching quotes: \(error)")
            }
        }
    }

    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(QuoteTableViewCell.self, forCellReuseIdentifier: "QuoteCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44


        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return market?.quotes?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuoteCell", for: indexPath) as! QuoteTableViewCell
        if let quote = market?.quotes?[indexPath.row] {
            cell.configure(with: quote)
        }
        return cell
    }
}
