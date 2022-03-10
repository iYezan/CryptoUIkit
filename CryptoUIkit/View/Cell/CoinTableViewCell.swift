//
//  CoinTableViewCell.swift
//  CryptoUIkit
//
//  Created by iYezan on 07/03/2022.
//

import UIKit

class CoinTableViewCell: UITableViewCell {
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    static let identifier = "NewsTableViewCell"
    
    let titleLabel                   = CTitleLabel(textAlignment: .left, fontSize: 22)
    let priceLabel                   = CTitleLabel(textAlignment: .right, fontSize: 16)
    let padding: CGFloat             = 20
    
    var coins    = [Coin]()
    var viewModels = [CoinTableViewCell]()
    
    //Configure all the data here
    func configure(with viewModel: Coin) {
        titleLabel.text = viewModel.name
        priceLabel.text = "$ \(viewModel.currentPrice)"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //Add all the subviews to ContentView
        addSubview(titleLabel)
        addSubview(priceLabel)
        
        configureTitleLabel()
        configurePriceLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configureTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            titleLabel.heightAnchor.constraint(equalToConstant: 80),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        ])
    }
    
    func configurePriceLabel() {
        NSLayoutConstraint.activate([
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            priceLabel.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50)
        ])
    }
}
