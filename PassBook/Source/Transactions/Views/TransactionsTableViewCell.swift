//
//  TransactionsTableViewCell.swift
//  PassBook
//
//  Created by Kiroshan Thayaparan on 8/31/22.
//

import UIKit

class TransactionsTableViewCell: UITableViewCell {
    
    var data: Transactions! = nil {
        didSet {
            labelDate.text = data.date?.getFormattedDate()
            labelAmount.text = "\(data.amount.intValue ?? 0)".toCurrencyFormat()
            labelDesc.text = data.description
            self.layoutIfNeeded()
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
        self.addSubview(labelDate)
        self.addSubview(labelAmount)
        self.addSubview(labelDesc)
        
        NSLayoutConstraint.activate([
            labelDate.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            labelDate.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            
            labelAmount.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            labelAmount.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            labelDesc.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            labelDesc.rightAnchor.constraint(equalTo: labelAmount.leftAnchor),
            labelDesc.topAnchor.constraint(equalTo: labelDate.bottomAnchor),
            labelDesc.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    var labelDate: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "26 August 2015"
        return label
    }()
    var labelDesc: UITextView = {
        var textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.isUserInteractionEnabled = false
        textView.backgroundColor = .white
        textView.textColor = .black
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.text = "TFR TO 012345 12345678\nMOB To-TEST DES BSB Ref-Testing Testing [Eff Date: 26 MAR 18]"
        return textView
    }()
    var labelAmount: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.backgroundColor = .white
        label.font = UIFont.systemFont(ofSize: 25)
        label.text = "$00,000000.00".toCurrencyFormat()
        label.textAlignment = .right
        return label
    }()
}
