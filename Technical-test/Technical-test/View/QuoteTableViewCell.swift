//
//  QuoteTableViewCell.swift
//  Technical-test
//
//  Created by Yaroslav Kupyak on 23.05.2023.
//

import UIKit

class QuoteTableViewCell: UITableViewCell {

    let nameLabel = UILabel()
    let lastLabel = UILabel()
    let currencyLabel = UILabel()
    let readableLastChangePercentLabel = UILabel()
    let favoriteImageView = UIImageView()
    private var favoritesManager: FavoritesManager?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        readableLastChangePercentLabel.font = UIFont.systemFont(ofSize: 22)

        addSubview(nameLabel)
        addSubview(lastLabel)
        addSubview(currencyLabel)
        addSubview(readableLastChangePercentLabel)
        addSubview(favoriteImageView)

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        lastLabel.translatesAutoresizingMaskIntoConstraints = false
        currencyLabel.translatesAutoresizingMaskIntoConstraints = false
        readableLastChangePercentLabel.translatesAutoresizingMaskIntoConstraints = false
        favoriteImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),

            lastLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            lastLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),

            currencyLabel.leadingAnchor.constraint(equalTo: lastLabel.trailingAnchor, constant: 16),
            currencyLabel.centerYAnchor.constraint(equalTo: lastLabel.centerYAnchor),

            readableLastChangePercentLabel.trailingAnchor.constraint(equalTo: favoriteImageView.leadingAnchor, constant: -16),
            readableLastChangePercentLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

            favoriteImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            favoriteImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            favoriteImageView.widthAnchor.constraint(equalToConstant: 24),
            favoriteImageView.heightAnchor.constraint(equalToConstant: 24),

            bottomAnchor.constraint(equalTo: lastLabel.bottomAnchor, constant: 8)
        ])
    }

    func configure(with quote: Quote, favoritesManager: FavoritesManager) {
        nameLabel.text = quote.name
        lastLabel.text = quote.last
        currencyLabel.text = quote.currency
        self.favoritesManager = favoritesManager
        readableLastChangePercentLabel.text = quote.readableLastChangePercent
        readableLastChangePercentLabel.textColor = UIColor.fromString(quote.variationColor)
        if favoritesManager.isFavorite(quote: quote) {
            favoriteImageView.image = UIImage(named: "favorite")
        } else {
            favoriteImageView.image = UIImage(named: "no-favorite")
        }
    }
}
