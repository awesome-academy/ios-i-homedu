//
//  UIViewController+.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 7/26/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//
import UIKit

extension UIViewController {
    //Tạo thông báo
    func creatAlert(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
