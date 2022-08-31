//
//  TopNavigationBarView.swift
//  PassBook
//
//  Created by Kiroshan Thayaparan on 8/30/22.
//

import UIKit

class TopNavigationBarView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInt()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInt() {
        self.addSubview(buttonLeft)
        self.addSubview(labelName)
        self.addSubview(labelTitle)
        self.addSubview(buttonRight)
        
        NSLayoutConstraint.activate([
            buttonLeft.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            buttonLeft.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            buttonLeft.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            buttonLeft.widthAnchor.constraint(equalToConstant: 30),
            buttonLeft.heightAnchor.constraint(equalToConstant: 30),
            
            labelName.leftAnchor.constraint(equalTo: buttonLeft.rightAnchor, constant: 15),
            labelName.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            labelTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            labelTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            buttonRight.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
            buttonRight.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            buttonRight.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            buttonRight.widthAnchor.constraint(equalToConstant: 30),
            buttonRight.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    var buttonLeft: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "menu"), for: .normal)
        return button
    }()
    var labelName: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.labelTitles.home
        label.textColor = .blue
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    var labelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.labelTitles.summary
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    var buttonRight: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "lock"), for: .normal)
        return button
    }()
}
