//
//  BottomNavigationBarView.swift
//  PassBook
//
//  Created by Kiroshan Thayaparan on 8/30/22.
//

import UIKit

class BottomNavigationBarView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInt()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInt() {
        self.addSubview(stackViewIcon)
        self.addSubview(stackViewTitle)
        
        NSLayoutConstraint.activate([
            stackViewIcon.leftAnchor.constraint(equalTo: self.leftAnchor),
            stackViewIcon.rightAnchor.constraint(equalTo: self.rightAnchor),
            stackViewIcon.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            stackViewIcon.heightAnchor.constraint(equalToConstant: 30),
            
            stackViewTitle.leftAnchor.constraint(equalTo: self.leftAnchor),
            stackViewTitle.rightAnchor.constraint(equalTo: self.rightAnchor),
            stackViewTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackViewTitle.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        stackViewIcon.addArrangedSubview(buttonSummary)
        stackViewIcon.addArrangedSubview(buttonAccounts)
        stackViewIcon.addArrangedSubview(buttonPayments)
        
        stackViewTitle.addArrangedSubview(labelSummary)
        stackViewTitle.addArrangedSubview(labelAccounts)
        stackViewTitle.addArrangedSubview(labelPayments)
    }
    
    var stackViewIcon: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = 10
        return view
    }()
    var stackViewTitle: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = 10
        return view
    }()
    var buttonSummary: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "summary"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.setImageTintColor(.darkGray)
        return button
    }()
    var labelSummary: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.labelTitles.summary
        label.textColor = .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    var buttonAccounts: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "accounts"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.setImageTintColor(.darkGray)
        return button
    }()
    var labelAccounts: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.labelTitles.accounts
        label.textColor = .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    var buttonPayments: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "payments"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.setImageTintColor(.darkGray)
        return button
    }()
    var labelPayments: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.labelTitles.payments
        label.textColor = .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
}

extension UIButton {
    func setImageTintColor(_ color: UIColor) {
        let tintedImage = self.imageView?.image?.withRenderingMode(.alwaysTemplate)
        self.setImage(tintedImage, for: .normal)
        self.tintColor = color
    }
}
