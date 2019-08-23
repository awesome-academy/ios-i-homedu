//
//  LoginController.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 7/31/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import UIKit
import Alamofire
import SAProgressHUB
import Then

final class LoginViewController: UIViewController {
    
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    private var isLogin = false
    private var isConnect = false
    private var dataAccount: InfoResponse?
    private let loading = SAProgressHUB(type: .lottie, style: .shadowBackground)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTextField()
        hideNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func buttonLogin(_ sender: Any) {
        if checkValidInput() {
            showIndicator(hub: loading)
            requestLogin()
        }
    }
    
    func registerTextField() {
        userNameTextField.do {
            $0.delegate = self
        }
        passwordTextField.do {
            $0.delegate = self
        }
    }
    
    ///check input when user typing or click button
    ///
    /// - Returns: True: Input valid, False: Input invalid
    func checkValidInput() -> Bool {
        let username: String.validateType = .username
        let password: String.validateType = .password
        if let userText = userNameTextField.text, let passText = passwordTextField.text {
            if !userText.isValidInput(username) &&
                !passText.isValidInput(password) {
                createAlert(title: NSLocalizedString(Constant.Alert.alertTitle, comment: ""),
                            message: NSLocalizedString(Constant.Alert.userAndPassError, comment: ""))
                return false
            }
            if !userText.isValidInput(username) {
                createAlert(title: NSLocalizedString(Constant.Alert.alertTitle, comment: ""),
                            message: NSLocalizedString(Constant.Alert.usernameError, comment: ""))
                return false
            }
            if !passText.isValidInput(password) {
                createAlert(title: NSLocalizedString(Constant.Alert.alertTitle, comment: ""),
                            message: NSLocalizedString(Constant.Alert.passwordError, comment: ""))
                return false
            }
        }
        return true
    }
    
    /// User Request Server for Login
    func requestLogin() {
        let param: Parameters = [
            "username": userNameTextField.text ?? "",
            "password": passwordTextField.text ?? ""
        ]
        AccountRequest.shared.login(param) { [unowned self] in
            self.isConnect = $0
            self.isLogin = $1
            self.dataAccount = $2
            guard let data = self.dataAccount else { return }
            let token = data.token
            let studentId = data.studentId
            UserDefaults.standard.set(token, forKey: "Authorization")
            UserDefaults.standard.set(studentId, forKey: "StudentID")
            self.hideIndicator(hub: self.loading)
            if self.isConnect {
                if self.isLogin {
                    let tabBar = TabbarController.instantiate()
                    self.navigationController?.pushViewController(tabBar, animated: true)
                } else {
                    self.createAlert(title: NSLocalizedString(Constant.Alert.alertTitle, comment: ""),
                                     message: NSLocalizedString(Constant.Alert.alertLoginFail, comment: ""))
                }
            } else {
                self.createAlert(title: NSLocalizedString(Constant.Alert.alertTitle, comment: ""),
                                 message: NSLocalizedString(Constant.Alert.internetError, comment: ""))
            }
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
