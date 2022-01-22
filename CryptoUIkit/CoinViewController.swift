//
//  ViewController.swift
//  CryptoUIkit
//
//  Created by iYezan on 21/01/2022.
//

import UIKit

class CoinViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    

    var tableView = UITableView()
    private let coinData = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view()
    }
    
    
    func view() {
        tableView = UITableView(frame: self.view.bounds, style: UITableView.Style.plain)
        tableView.dataSource = self
        tableView.delegate   = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
        NetworkManager.shared.getCoins { result in
            
            switch result {
            case .success(let coins):
                print(coins)
                
            case .failure(let error):
               print("") //
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text  = NetworkManager.shared
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
}

