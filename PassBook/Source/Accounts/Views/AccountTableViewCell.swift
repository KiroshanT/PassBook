//
//  AccountTableViewCell.swift
//  PassBook
//
//  Created by Kiroshan Thayaparan on 8/30/22.
//

import UIKit

class AccountTableViewCell: UITableViewCell {
    
    //random background images array
    let bgIcon = ["bg1", "bg2", "bg3", "bg4"]
    
    var data: Accounts! = nil {
        didSet {
            labelAccount.text = data.accountLabel
            labelAccountNo.text = data.accountNumber
            labelAvailableBalance.text = "\(data.availableBalance.toCurrencyFormat())"
            labelCurrentBalance.text = "\(data.currentBalance.toCurrencyFormat())"
        }
    }
    var index: Int = 0 {
        didSet {
            let iconIndex: Int = index % 4
            backImageView.image = UIImage(named: bgIcon[iconIndex])
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.isUserInteractionEnabled = true
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        self.backgroundColor = .white
        self.addSubview(backImageView)
        self.addSubview(backView)
        backView.addSubview(labelAccount)
        backView.addSubview(labelAccountNo)
        backView.addSubview(labelAvailableBalance)
        backView.addSubview(labelCurrentBalance)
        backView.addSubview(labelAvailable)
        backView.addSubview(labelCurrent)
        backView.addSubview(buttonArrow)
        
        NSLayoutConstraint.activate([
            backImageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            backImageView.rightAnchor.constraint(equalTo: self.rightAnchor),
            backImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            
            backView.leftAnchor.constraint(equalTo: self.leftAnchor),
            backView.rightAnchor.constraint(equalTo: self.rightAnchor),
            backView.bottomAnchor.constraint(equalTo: backImageView.bottomAnchor),
            
            labelAccount.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 20),
            labelAccount.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -20),
            labelAccount.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),
            
            labelAccountNo.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 20),
            labelAccountNo.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -20),
            labelAccountNo.topAnchor.constraint(equalTo: labelAccount.bottomAnchor, constant: 2),
            
            labelAvailableBalance.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 20),
            labelAvailableBalance.topAnchor.constraint(equalTo: labelAccountNo.bottomAnchor, constant: 3),
                        
            labelAvailable.leftAnchor.constraint(equalTo: labelAvailableBalance.rightAnchor, constant: 10),
            labelAvailable.centerYAnchor.constraint(equalTo: labelAvailableBalance.centerYAnchor),
            
            labelCurrentBalance.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 20),
            labelCurrentBalance.topAnchor.constraint(equalTo: labelAvailableBalance.bottomAnchor, constant: 3),
            labelCurrentBalance.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -5),
            
            labelCurrent.leftAnchor.constraint(equalTo: labelCurrentBalance.rightAnchor, constant: 10),
            labelCurrent.centerYAnchor.constraint(equalTo: labelCurrentBalance.centerYAnchor),
            
            buttonArrow.rightAnchor.constraint(equalTo: backView.rightAnchor),
            buttonArrow.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            buttonArrow.heightAnchor.constraint(equalToConstant: 30),
            buttonArrow.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    var backImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return view
    }()
    var labelAccount: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "On Call Saving"
        return label
    }()
    var labelAccountNo: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "123456789"
        return label
    }()
    var labelCurrentBalance: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.text = "$0.00"
        return label
    }()
    var labelCurrent: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "Current"
        return label
    }()
    var labelAvailableBalance: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.text = "$0.00"
        return label
    }()
    var labelAvailable: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "Available"
        return label
    }()
    var buttonArrow: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "arrow_right"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
}
