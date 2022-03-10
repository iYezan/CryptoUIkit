//
//  Ext+TableView.swift
//  CryptoUIkit
//
//  Created by iYezan on 07/03/2022.
//

import UIKit

extension CryptoVC {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CoinTableViewCell.identifier,
                                                       for: indexPath) as? CoinTableViewCell else { fatalError() }
        cell.configure(with: coins[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}
