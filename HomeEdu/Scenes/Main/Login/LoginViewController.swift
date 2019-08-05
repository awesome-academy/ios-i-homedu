//
//  LoginController.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 7/31/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import UIKit
import Alamofire


final class LoginViewController: UIViewController {
    
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    private var isLogin = false
    private var isConnect = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func buttonLogin(_ sender: Any) {
        if checkValidInput() {
            requestLogin()
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
        AccountRequest.shared.login(param) {
            self.isLogin = $0
            self.isConnect = $1
            if self.isConnect {
                if self.isLogin {
                    let tabBarSB = Storyboards.tabBar
                    let tabBar = tabBarSB.instantiateViewController(withIdentifier: "TabBar")
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
