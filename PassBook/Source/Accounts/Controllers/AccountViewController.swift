//
//  AccountViewController.swift
//  PassBook
//
//  Created by Kiroshan Thayaparan on 8/30/22.
//

import UIKit

class AccountViewController: BaseViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.register(AccountTableViewCell.self, forCellReuseIdentifier: "AccountTableViewCell")
        tableView.separatorStyle = .none
        return tableView
    }()
    
    var accountModel = AccountModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: topNavBar.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomNavBar.topAnchor)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.selectedIndex = 0
        getAccounts()
    }
}

extension AccountViewController {
    
    func getAccounts() {
        accountModel.getAccounts { (acount, error ) in
            self.tableView.reloadData()
        }
    }
}

extension AccountViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.accountModel.accounts?.accounts!.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountTableViewCell", for: indexPath) as! AccountTableViewCell
        cell.selectionStyle = .none
        cell.index = indexPath.row
        cell.data = self.accountModel.accounts?.accounts![indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = TransactionViewController()
        controller.index = indexPath.row
        controller.account = self.accountModel.accounts?.accounts![indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}
