//
//  AuthorizationViewController.swift
//  newVK
//
//  Created by Николай Онучин on 20.02.2022.
//

import UIKit

class AuthorizationViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
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
              let keyboardSize = info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue else {return}
        
        let keyboardHeight = keyboardSize.cgRectValue.size.height
        
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
        
    }
    
    @objc func willHideKeyboard(_ notification: Notification) {
        guard let info = notification.userInfo as NSDictionary?,
              let keyboardSize = info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue else {return}
        
        let keyboardHeight = keyboardSize.cgRectValue.size.height
        
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: -keyboardHeight, right: 0)
    }
    
    @IBAction func tapButtonLogin(_ sender: Any) {
        guard let login = loginTextField.text,
              let password = passwordTextField.text,
              login == "",
              password == "" else {return}
        
        performSegue(withIdentifier: "Login", sender: nil)
    }

}
