//
//  MainViewController.swift
//  CryptoConverter
//
//  Created by Данила on 06.05.2022.
//

import UIKit
import Foundation

class MainViewController: UIViewController {
    
    var networkManager = NetworkManager()
    
    private var mainView: MainView! {
        guard isViewLoaded else { return nil }
        return (view as! MainView)
    }
    
    override func loadView() {
        self.view = MainView(frame: UIScreen.main.bounds)
        self.view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationControllerSettings()
        self.mainView.setConstreints()
        self.mainView.searchButton.addTarget(self, action: #selector(updateCrypto), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardDidHideNotification, object: nil)
        self.hideKeyboardWhenTappedAround()
    }
    
    private func navigationControllerSettings() {
        self.navigationItem.title = "Converter"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(descriptor: UIFontDescriptor(name: "American Typewriter Bold", size: 32), size: 32)]
    }
    
    // MARK: - Action
    @objc func updateCrypto() {
        
        let tickerOne = self.mainView.firstTickerTextField.text?.uppercased()
        let tickerTwo = self.mainView.secondTickerTextField.text?.uppercased()
        
        if tickerOne != "" && tickerTwo != "" {
            networkManager.fetchDataWithAlamofire(tickerOne: tickerOne!, tickerTwo: tickerTwo!) { data in
                if data == nil {
                    self.alert()
                    print("nil data response")
                } else {
                    guard let answer = data else { return }
                    self.mainView.priceLabel.text = String(format:"%.8f", answer.value)
                    self.mainView.firstTickerLabel.text = tickerOne!
                    self.mainView.secondTickerLabel.text = tickerTwo!
                    
                    if self.mainView.quantityTextField.text != "" {
                        
                        let xStr = self.mainView.quantityTextField.text
                        
                        let result = Double(xStr!)! * answer.value
                        self.mainView.convertLabel.text = String(format:"%.7f", result)
                    }
                }
            }
        } else {
            alert()
            print("alert")
        }
    }
    
    private func alert() {
        let alertController = UIAlertController(title: "New Ticket", message: "Enter the correct tickers", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(ok)
        present(alertController, animated: true, completion: nil)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        
        view.endEditing(true)
    }
    
    // MARK: - KeyBoard Notification
    @objc func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        let kbFrameSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        self.mainView!.contentSize = CGSize(width: self.mainView.bounds.size.width, height: self.mainView.bounds.size.height + (kbFrameSize.height / 2))
        self.mainView!.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbFrameSize.height, right: 0)
        
    }
    
    @objc func keyboardWillHide() {
        
        self.mainView!.contentSize = CGSize(width: self.mainView.bounds.size.width, height: self.mainView.bounds.size.height)
        
    }
}

