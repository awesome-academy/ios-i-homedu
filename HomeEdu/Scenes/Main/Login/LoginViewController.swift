//
//  LoginController.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 7/31/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

final class LoginViewController: UIViewController {
    
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    private var isLogin = false
    
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
        let username: String.ValidateType = .username
        let password: String.ValidateType = .password
        if let userText = userNameTextField.text, let passText = passwordTextField.text {
            print("Username " + "\(userText.isValid(username))")
            print("Password " + "\(userText.isValid(password))")
            if !userText.isValid(username) &&
                !passText.isValid(password) {
                creatAlert(title: Vietnamese.Alert.alertTitle, message: Vietnamese.Alert.messageMissUserAndPass)
                return false
            }
            if !userText.isValid(username) {
                creatAlert(title: Vietnamese.Alert.alertTitle,
                           message: Vietnamese.Alert.messageMissUsername)
                return false
            }
            if !passText.isValid(password) {
                creatAlert(title: Vietnamese.Alert.alertTitle,
                           message: Vietnamese.Alert.messageMissPassword)
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
        AccountRepository.shared.login(param) {
            self.isLogin = $0
            if self.isLogin {
                let tabBarSB = Storyboards.tabBar
                let tabBar = tabBarSB.instantiateViewController(withIdentifier: "TabBar")
                self.navigationController?.pushViewController(tabBar, animated: true)
            } else {
                self.creatAlert(title: Vietnamese.Alert.alertTitle,
                           message: Vietnamese.Alert.alertLoginFail)
            }
        }
    }
}
