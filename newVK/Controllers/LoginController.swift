//
//  AuthorizationViewController.swift
//  newVK
//
//  Created by Николай Онучин on 20.02.2022.
//

import UIKit

class LoginController: UIViewController {
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var animationView: UIView!
    @IBOutlet var animationCenterImage: UIImageView!
    @IBOutlet var animationRightImage: UIImageView!
    @IBOutlet var animationLeftImage: UIImageView!
    @IBOutlet var entryButton: UIButton!
    @IBOutlet var registrationButton: UIButton!
    @IBOutlet var forgotButton: UIButton!
    @IBOutlet var logoImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGR = UITapGestureRecognizer(target: self, action: #selector(hideScreen))
        view.addGestureRecognizer(tapGR)
    }
    
    @objc func hideScreen() {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(willShowKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(willHideKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func willShowKeyboard(_ notification: Notification) {
        guard let info = notification.userInfo as NSDictionary?,
              let keyboardSize = info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue else { return }
        
        let keyboardHeight = keyboardSize.cgRectValue.size.height
        
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
    }
    
    @objc func willHideKeyboard(_ notification: Notification) {
        guard let info = notification.userInfo as NSDictionary?,
              let keyboardSize = info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue else { return }
        
        let keyboardHeight = keyboardSize.cgRectValue.size.height
        
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: -keyboardHeight, right: 0)
    }
    
    @IBAction func tapButtonLogin(_ sender: Any) {
        guard let login = loginTextField.text,
              let password = passwordTextField.text,
              login == "",
              password == "" else {
                  show(message: "Неверный логин или пароль!")
                  return
              }
        
        self.loginTextField.alpha = 0
        self.passwordTextField.alpha = 0
        self.entryButton.alpha = 0
        self.forgotButton.alpha = 0
        self.registrationButton.alpha = 0
        
        UIView.animate(withDuration: 0.1,
                       delay: 0,
                       options: [.repeat, .autoreverse]) {
            self.animationLeftImage.tintColor = .white
        }
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.1,
                       options: [.repeat, .autoreverse]) {
            self.animationCenterImage.tintColor = .white
        }
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.2,
                       options: [.repeat, .autoreverse]) {
            self.animationRightImage.tintColor = .white
        }
        
        UIView.animate(withDuration: 1,
                       delay: 0.2) {
            self.logoImage.alpha = 0
        } completion: { _ in
            self.performSegue(withIdentifier: "Login", sender: nil)
        }
    }
}
