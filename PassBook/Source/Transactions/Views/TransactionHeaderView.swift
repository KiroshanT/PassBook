//
//  TransactionHeaderView.swift
//  PassBook
//
//  Created by Kiroshan Thayaparan on 8/31/22.
//

import UIKit

class TransactionHeaderView: UIView {
    
    //random background images array
    let bgIcon = ["bg1", "bg2", "bg3", "bg4"]
    
    var data: Accounts! = nil {
        didSet {
            labelAccount.text = data.accountLabel
            labelAccountNo.text = data.accountNumber
            labelAvailableBalance.text = data.availableBalance.toCurrencyFormat()
        }
    }
    var iconIndex: Int = 0 {
        didSet {
            let iconIndex: Int = iconIndex % 4
            backImageView.image = UIImage(named: bgIcon[iconIndex])
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInt()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInt() {
        self.backgroundColor = .white
        self.addSubview(backImageView)
        self.addSubview(backView)
        self.addSubview(buttonInfo)
        backView.addSubview(buttonArrowLeft)
        backView.addSubview(labelAccount)
        backView.addSubview(labelAccountNo)
        backView.addSubview(labelAvailableBalance)
        backView.addSubview(labelAvailable)
        backView.addSubview(buttonArrowRight)
        
        NSLayoutConstraint.activate([
            backImageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            backImageView.rightAnchor.constraint(equalTo: self.rightAnchor),
            backImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            backView.leftAnchor.constraint(equalTo: self.leftAnchor),
            backView.rightAnchor.constraint(equalTo: self.rightAnchor),
            backView.bottomAnchor.constraint(equalTo: backImageView.bottomAnchor),
            
            buttonInfo.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            buttonInfo.rightAnchor.constraint(equalTo: self.rightAnchor),
            buttonInfo.heightAnchor.constraint(equalToConstant: 30),
            buttonInfo.heightAnchor.constraint(equalToConstant: 30),
            
            buttonArrowLeft.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: -10),
            buttonArrowLeft.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            buttonArrowLeft.heightAnchor.constraint(equalToConstant: 30),
            buttonArrowLeft.heightAnchor.constraint(equalToConstant: 30),
            
            labelAccount.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 50),
            labelAccount.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -20),
            labelAccount.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),
            
            labelAccountNo.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 50),
            labelAccountNo.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -20),
            labelAccountNo.topAnchor.constraint(equalTo: labelAccount.bottomAnchor, constant: 2),
            
            labelAvailableBalance.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 50),
            labelAvailableBalance.topAnchor.constraint(equalTo: labelAccountNo.bottomAnchor, constant: 3),
            labelAvailableBalance.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -5),
                        
            labelAvailable.leftAnchor.constraint(equalTo: labelAvailableBalance.rightAnchor, constant: 10),
            labelAvailable.centerYAnchor.constraint(equalTo: labelAvailableBalance.centerYAnchor),
            
            buttonArrowRight.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: 10),
            buttonArrowRight.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            buttonArrowRight.heightAnchor.constraint(equalToConstant: 30),
            buttonArrowRight.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    var backImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "bg1")
        return view
    }()
    var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return view
    }()
    var buttonInfo: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "info"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    var buttonArrowLeft: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "arrow_left"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
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
    var buttonArrowRight: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "arrow_right"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
}
