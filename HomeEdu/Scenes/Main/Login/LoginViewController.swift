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
        if validateButton() {
            requestLogin()
        }
    }
    
    //Validate button
    func validateButton() -> Bool {
        if userNameTextField.text!.isEmpty && passwordTextField.text!.isEmpty {
            creatAlert(title: Constant.Alert.alertTitle, message: Constant.Alert.messageMissUserAndPass)
            return false
        } else if userNameTextField.text!.isEmpty {
            creatAlert(title: Constant.Alert.alertTitle,
                       message: Constant.Alert.messageMissUsername)
            return false
        } else if passwordTextField.text!.isEmpty {
            creatAlert(title: Constant.Alert.alertTitle,
                       message: Constant.Alert.messageMissPassword)
            return false
        } else {
            return true
        }
    }
    
    //Request Server
    func requestLogin() {
        let param: Parameters = [
            "username": userNameTextField.text ?? "",
            "password": passwordTextField.text ?? ""
        ]
        LoginReqest.shared.loginRequestFromApi(param){
            self.isLogin = $0
            if self.isLogin {
                let tabBarSB = Storyboards.tabBar
                let tabBar = tabBarSB.instantiateViewController(withIdentifier: "TabBar")
                self.navigationController?.pushViewController(tabBar, animated: true)
            } else {
                self.creatAlert(title: Constant.Alert.alertTitle,
                           message: Constant.Alert.alertLoginFail)
            }
        }
    }
}
