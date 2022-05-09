//
//  MainView.swift
//  CryptoConverter
//
//  Created by Данила on 06.05.2022.
//

import UIKit

class MainView: UIScrollView {
    
    let firstTickerTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "first ticker"
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        textField.attributedPlaceholder = NSAttributedString(
            string: "first ticker",
            attributes: [.paragraphStyle: centeredParagraphStyle]
        )
        textField.font = UIFont(name: "TamilSangamMN", size: 12)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let slashLabel: UILabel = {
        let label = UILabel()
        label.text = "/"
        label.font = UIFont(name: "American Typewriter Bold", size: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let secondTickerTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        textField.attributedPlaceholder = NSAttributedString(
            string: "second ticker",
            attributes: [.paragraphStyle: centeredParagraphStyle]
        )
        textField.font = UIFont(name: "TamilSangamMN", size: 12)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    
    
    let textPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "Price:"
        label.font = UIFont(name: "TamilSangamMN-Bold", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "0.0"
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        label.font = UIFont(name: "TamilSangamMN", size: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray.withAlphaComponent(0.5)
        button.layer.cornerRadius = 5
        button.setImage(UIImage(systemName: "arrow.clockwise"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    
    let quantityTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "how many coins?"
        //        textField.keyboardType = UIKeyboardType.numberPad
        textField.font = UIFont(name: "TamilSangamMN", size: 16)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let firstTickerLabel: UILabel = {
        let label = UILabel()
        label.text = "BTC"
        label.textAlignment = .center
        label.font = UIFont(name: "TamilSangamMN", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    
    let textConvertLabel: UILabel = {
        let label = UILabel()
        label.text = "Conversion:"
        label.font = UIFont(name: "TamilSangamMN-Bold", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let convertLabel: UILabel = {
        let label = UILabel()
        label.text = "0.0"
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        label.font = UIFont(name: "TamilSangamMN", size: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let secondTickerLabel: UILabel = {
        let label = UILabel()
        label.text = "USD"
        label.textAlignment = .center
        label.font = UIFont(name: "TamilSangamMN", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - StackView
    let globalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing   = 32.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let s1StackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.horizontal
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing   = 8.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let s2StackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.horizontal
        stackView.distribution  = UIStackView.Distribution.fillProportionally
        stackView.alignment = UIStackView.Alignment.bottom
        stackView.spacing   = 12.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let s3StackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.horizontal
        stackView.distribution  = UIStackView.Distribution.fillProportionally
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing   = 12.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let s4StackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.horizontal
        stackView.distribution  = UIStackView.Distribution.fillProportionally
        stackView.alignment = UIStackView.Alignment.bottom
        stackView.spacing   = 12.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    func setConstreints() {
        
        s1StackView.addArrangedSubview(firstTickerTextField)
        s1StackView.addArrangedSubview(slashLabel)
        s1StackView.addArrangedSubview(secondTickerTextField)
        
        s2StackView.addArrangedSubview(textPriceLabel)
        s2StackView.addArrangedSubview(priceLabel)
        s2StackView.addArrangedSubview(searchButton)
        
        s3StackView.addArrangedSubview(quantityTextField)
        s3StackView.addArrangedSubview(firstTickerLabel)
        
        s4StackView.addArrangedSubview(textConvertLabel)
        s4StackView.addArrangedSubview(convertLabel)
        s4StackView.addArrangedSubview(secondTickerLabel)
        
        globalStackView.addArrangedSubview(s1StackView)
        globalStackView.addArrangedSubview(s2StackView)
        globalStackView.addArrangedSubview(s3StackView)
        globalStackView.addArrangedSubview(s4StackView)
        
        
        
        self.addSubview(globalStackView)
        
        NSLayoutConstraint.activate([
            
            globalStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: UIScreen.main.bounds.height / 6),
            globalStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            
            quantityTextField.widthAnchor.constraint(equalToConstant: 200),
            quantityTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            firstTickerTextField.widthAnchor.constraint(equalToConstant: 100),
            secondTickerTextField.widthAnchor.constraint(equalToConstant: 100),
            
            slashLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -6),
            textPriceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            textPriceLabel.widthAnchor.constraint(equalToConstant: 50),
            textConvertLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            textConvertLabel.widthAnchor.constraint(equalToConstant: 66),
            searchButton.leadingAnchor.constraint(equalTo: self.trailingAnchor, constant: -56),
            searchButton.widthAnchor.constraint(equalToConstant: 46),
            searchButton.heightAnchor.constraint(equalToConstant: 26),
            firstTickerLabel.leadingAnchor.constraint(equalTo: self.trailingAnchor, constant: -56),
            firstTickerLabel.widthAnchor.constraint(equalToConstant: 46),
            secondTickerLabel.leadingAnchor.constraint(equalTo: self.trailingAnchor, constant: -56),
            secondTickerLabel.widthAnchor.constraint(equalToConstant: 46)
        ])
        
    }
    
}
