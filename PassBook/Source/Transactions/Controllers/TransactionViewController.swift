//
//  TransactionViewController.swift
//  PassBook
//
//  Created by Kiroshan Thayaparan on 8/31/22.
//

import UIKit

class TransactionViewController: BaseViewController {
    
    lazy var header: TransactionHeaderView = {
        let view = TransactionHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.register(TransactionsTableViewCell.self, forCellReuseIdentifier: "TransactionsTableViewCell")
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    var transactionModel = TransactionModel()
    var index: Int?
    var account: Accounts? = nil {
        didSet {
            header.data = account
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewsSetup()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.selectedIndex = 1
        header.iconIndex = index!
        getAccounts(url: account!.transactions)
    }
    
    private func viewsSetup() {
        view.addSubview(header)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            header.leftAnchor.constraint(equalTo: view.leftAnchor),
            header.rightAnchor.constraint(equalTo: view.rightAnchor),
            header.topAnchor.constraint(equalTo: topNavBar.bottomAnchor),
            header.heightAnchor.constraint(equalToConstant: 180),
            
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: header.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomNavBar.topAnchor)
        ])
        
        topNavBar.labelTitle.text = Constants.labelTitles.accounts
    }
}

extension TransactionViewController {
    
    func getAccounts(url: String) {
        transactionModel.getTransaction(url: url) { (transaction, error ) in
            self.tableView.reloadData()
        }
    }
}

extension TransactionViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.transactionModel.transaction?.transactions?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionsTableViewCell", for: indexPath) as! TransactionsTableViewCell
        cell.selectionStyle = .none
        cell.data = transactionModel.transaction?.transactions![indexPath.row]
        return cell
    }
}
