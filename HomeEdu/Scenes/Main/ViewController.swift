//
//  ViewController.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 7/24/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        username.text = ""
        password.text = ""
    }
    @IBAction func btn_Login(_ sender: Any) {
        requestLogin()
        
    }
    //Kiểm tra xác thực của tài khoản khi đăng nhập
    func checkAuthentication(_ check:String){
        if (check == "true"){
            let tabBarSB = Storyboards.TabBar
            let tabBar = tabBarSB.instantiateViewController(withIdentifier: "tabBar")
            self.navigationController?.pushViewController(tabBar, animated: true)
        } else if (check == "false") {
            creatAlert(title: "Thông Báo", message: "Bạn đã nhập sai Username hoặc Password")
        } else {
            creatAlert(title: "Thông Báo", message: "Bạn hãy kiểm tra lại đường truyền mạng")
        }
    }
    
    //request đến server
    func requestLogin(){
        let param: Parameters = [
            "username" : username.text!,
            "password" : password.text!
        ]
        let url = "https://homedu.herokuapp.com/api/login"
        Alamofire.request(url, method: .post, parameters: param, encoding: JSONEncoding.default, headers: [:]).responseJSON {(response) in
            switch response.result {
                case .success(let data):
                    let arrayJSON = JSON(data)
                    self.checkAuthentication(arrayJSON["success"].stringValue)
                    SaveData.token = arrayJSON["token"].stringValue
                    //Lưu thông tin sinh viên
                    let infoUser = arrayJSON["data"].arrayValue
                    SaveData.hovaten = infoUser[0]["fullname"].stringValue
                    SaveData.masinhvien = infoUser[0]["student_id"].stringValue
                    SaveData.gioitinh = infoUser[0]["sex"].stringValue
                    SaveData.ngaysinh = infoUser[0]["birthday"].stringValue
                    SaveData.vnuMail = infoUser[0]["email"].stringValue
                    SaveData.otherMail = infoUser[0]["other_mail"].stringValue
                    SaveData.thongtinSV += [SaveData.hovaten, SaveData.masinhvien, SaveData.gioitinh, SaveData.ngaysinh, SaveData.vnuMail, SaveData.otherMail]
                    print(SaveData.thongtinSV)
                    SaveData.kieudaotao = infoUser[0]["program_type"].stringValue
                    SaveData.lop = infoUser[0]["class"].stringValue
                    SaveData.thongtinDT += [SaveData.kieudaotao, SaveData.lop]
                    SaveData.quoctich = infoUser[0]["nation"].stringValue
                    SaveData.diachi = infoUser[0]["address"].stringValue
                    SaveData.thongtinQQ += [SaveData.quoctich, SaveData.diachi]
                case .failure(let error):
                    print(error)
            }
        }
    }
}

