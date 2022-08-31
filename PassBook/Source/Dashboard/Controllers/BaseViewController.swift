//
//  BaseViewController.swift
//  PassBook
//
//  Created by Kiroshan Thayaparan on 8/30/22.
//

import UIKit

class BaseViewController: UIViewController {
    
    var topNavBar: TopNavigationBarView = {
        let view = TopNavigationBarView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var bottomNavBar: BottomNavigationBarView = {
        let view = BottomNavigationBarView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var selectedIndex: Int = 0 {
        didSet {
            if selectedIndex == 0 {
                resetColor()
                bottomNavBar.buttonSummary.setImageTintColor(.blue)
                bottomNavBar.labelSummary.textColor = .blue
            } else if selectedIndex == 1 {
                resetColor()
                bottomNavBar.buttonAccounts.setImageTintColor(.blue)
                bottomNavBar.labelAccounts.textColor = .blue
            } else if selectedIndex == 2 {
                resetColor()
                bottomNavBar.buttonPayments.setImageTintColor(.blue)
                bottomNavBar.labelPayments.textColor = .blue
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        viewsSetup()
    }
    
    private func viewsSetup() {
        view.addSubview(topNavBar)
        view.addSubview(bottomNavBar)
        
        NSLayoutConstraint.activate([
            topNavBar.leftAnchor.constraint(equalTo: view.leftAnchor),
            topNavBar.rightAnchor.constraint(equalTo: view.rightAnchor),
            topNavBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topNavBar.heightAnchor.constraint(equalToConstant: 50),
            
            bottomNavBar.leftAnchor.constraint(equalTo: view.leftAnchor),
            bottomNavBar.rightAnchor.constraint(equalTo: view.rightAnchor),
            bottomNavBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomNavBar.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        bottomNavBar.buttonSummary.addTarget(self, action: #selector(buttonSummaryAction), for: .touchUpInside)
        bottomNavBar.buttonAccounts.addTarget(self, action: #selector(buttonAccountsAction), for: .touchUpInside)
        bottomNavBar.buttonPayments.addTarget(self, action: #selector(buttonPaymentsAction), for: .touchUpInside)
    }
    
    @objc func buttonSummaryAction() {
        selectedIndex = 0
        
        if self is AccountViewController {
            return
        }
        
        if self is TransactionViewController {
            navigationController?.popViewController(animated: true)
        } else {
            navigationController?.pushViewController(AccountViewController(), animated: true)
        }
    }
    
    @objc func buttonAccountsAction() {
        selectedIndex = 1
    }
    
    @objc func buttonPaymentsAction() {
        selectedIndex = 2
    }
    
    func resetColor() {
        bottomNavBar.buttonSummary.setImageTintColor(.darkGray)
        bottomNavBar.buttonAccounts.setImageTintColor(.darkGray)
        bottomNavBar.buttonPayments.setImageTintColor(.darkGray)
        
        bottomNavBar.labelSummary.textColor = .darkGray
        bottomNavBar.labelAccounts.textColor = .darkGray
        bottomNavBar.labelPayments.textColor = .darkGray
    }
}
