//
//  ViewController.swift
//  CryptoUIkit
//
//  Created by iYezan on 21/01/2022.
//

import UIKit

class CryptoVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var textLable = UILabel()
    
    private let tableView       = UITableView(frame: .zero, style: .plain)
    private let coinData = NetworkManager.shared
    var viewModels = [CoinTableViewCell]()
    
    var coins = [Coin]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchTopStories()
        setupNavigationController()
        
        let timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(refreshData), userInfo: nil, repeats: true)
    }
    
    func setupTableView() {
        
        view.addSubview(tableView)
        tableView.register(CoinTableViewCell.self, forCellReuseIdentifier: CoinTableViewCell.identifier)
        tableView.dataSource    = self
        tableView.delegate      = self
        tableView.rowHeight     = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
}

extension  CryptoVC {
    private func fetchTopStories () {
        NetworkManager.shared.getCoins { [weak self] result in
            switch result{
            case .success(let articles):
                self?.coins = articles
             
                // Once ViewModels are ready, table view should refresh
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: Update the price every so often
    @objc func refreshData() -> Void {
        fetchTopStories()
    }
    
    private func setupNavigationController() {
        title = "Wallet"
        navigationController?.navigationBar.prefersLargeTitles  = true
        navigationController?.navigationBar.backgroundColor     = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles  = true
        navigationController?.hidesBarsOnSwipe                  = false
        navigationItem.hidesSearchBarWhenScrolling              = false
    }
}

