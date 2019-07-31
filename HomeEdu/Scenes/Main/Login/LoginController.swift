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

class LoginController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    private var checkLogin = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        username.text = ""
        password.text = ""
    }
    
    @IBAction func buttonLogin(_ sender: Any) {
        if (username.text == "" && password.text == ""){
            creatAlert(title: Constant.alert.alertTitle, message: Constant.alert.messageMissUserAndPass)
        } else if (username.text == ""){
            creatAlert(title: Constant.alert.alertTitle, message: Constant.alert.messageMissUsername)
        } else if (password.text == ""){
            creatAlert(title: Constant.alert.alertTitle, message: Constant.alert.messageMissPassword)
        } else {
            requestLogin()
        }
    }
    
    //Kiểm tra xác thực của tài khoản khi đăng nhập
    func checkAuthentication(_ check:String){
        if (check == "true") {
            checkLogin = true
            let tabBarSb = Storyboards.tabBar
            let tabBar = tabBarSb.instantiateViewController(withIdentifier: "TabBar")
            self.navigationController?.pushViewController(tabBar, animated: true)
        } else {
            creatAlert(title: Constant.alert.alertTitle, message: Constant.alert.alertLoginFail)
        }
    }
    
    //request đến server
    func requestLogin(){
        let param: Parameters = [
            "username" : username.text!,
            "password" : password.text!
        ]
        Alamofire.request(URLs.urlLogin, method: .post, parameters: param, encoding: JSONEncoding.default, headers: [:]).responseJSON {(response) in
            switch response.result {
            case .success(let data):
                let arrayJSON = JSON(data)
                self.checkAuthentication(arrayJSON[DataJSON.success].stringValue)
                if self.checkLogin {
                    SaveInfoStudent.token = arrayJSON[DataJSON.token].stringValue
                    let infoUser = arrayJSON[DataJSON.data].arrayValue
                    //Lưu thông tin sinh viên
                    SaveInfoStudent.fullName = infoUser[0][DataJSON.fullname].stringValue
                    SaveInfoStudent.studentId = infoUser[0][DataJSON.studentId].stringValue
                    SaveInfoStudent.sex = infoUser[0][DataJSON.sex].stringValue
                    SaveInfoStudent.birthday = infoUser[0][DataJSON.birthday].stringValue
                    SaveInfoStudent.vnuMail = infoUser[0][DataJSON.email].stringValue
                    SaveInfoStudent.otherMail = infoUser[0][DataJSON.otherMail].stringValue
                    SaveInfoStudent.infoStudent += [SaveInfoStudent.fullName, SaveInfoStudent.studentId, SaveInfoStudent.sex, SaveInfoStudent.birthday, SaveInfoStudent.vnuMail, SaveInfoStudent.otherMail]
                    SaveInfoStudent.programType = infoUser[0][DataJSON.programType].stringValue
                    SaveInfoStudent.classStudent = infoUser[0][DataJSON.classStudent].stringValue
                    SaveInfoStudent.infoClass += [SaveInfoStudent.programType, SaveInfoStudent.classStudent]
                    SaveInfoStudent.nation = infoUser[0][DataJSON.nation].stringValue
                    SaveInfoStudent.address = infoUser[0][DataJSON.address].stringValue
                    SaveInfoStudent.infoAdress += [SaveInfoStudent.nation, SaveInfoStudent.address]
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
