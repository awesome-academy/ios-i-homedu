//
//  EditStudentInfo.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 8/20/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import UIKit
import Reusable
import Alamofire

class EditStudentInfo: UIViewController {
    @IBOutlet weak private var fullnameTextField: UITextField!
    @IBOutlet weak private var birthdayTextField: UITextField!
    @IBOutlet weak private var sexTextField: UITextField!
    @IBOutlet weak private var otherMailTextField: UITextField!
    @IBOutlet weak private var nationTextField: UITextField!
    @IBOutlet weak private var addressTextField: UITextField!
    private var fullnameValue = ""
    private var birthdayValue = ""
    private var sexValue = ""
    private var otherMailValue = ""
    private var nationValue = ""
    private var addressValue = ""
    private var isSuccessEdit = false
    private var isConnect = false
    private var datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDatePicker()
        configView()
    }
    
    private func configView() {
        fullnameTextField.text = fullnameValue
        birthdayTextField.text = birthdayValue
        sexTextField.text = sexValue
        otherMailTextField.text = otherMailValue
        nationTextField.text = nationValue
        addressTextField.text = addressValue
    }
    
    func changeInfoValue(fullname: String,
                         birthday: String,
                         sex: String,
                         otherMail: String,
                         nation: String,
                         address: String) {
        fullnameValue = fullname
        birthdayValue = birthday
        sexValue = sex
        otherMailValue = otherMail
        nationValue = nation
        addressValue = address
    }
    
    func setUpDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.addTarget(self,
                             action: #selector(EditStudentInfo.dateChanged(dataPicker:)),
                             for: .valueChanged)
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(EditStudentInfo.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        birthdayTextField.inputView = datePicker
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func dateChanged(dataPicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        birthdayTextField.text = dateFormatter.string(from: datePicker.date)
        print("date: \(dateFormatter.string(from: datePicker.date))")
        view.endEditing(true)
    }
    
    @IBAction func buttonBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buttonSave(_ sender: Any) {
        if checkInfoChange() {
            confirmChangeInfo()
        } else {
            self.createAlert(title: NSLocalizedString(Constant.Alert.alertTitle, comment: ""),
                             message: NSLocalizedString(Constant.Alert.editInfoError, comment: ""))
        }
    }
    
    func requestEditInfo() {
        let param: Parameters = [
            "fullname": fullnameTextField.text ?? "",
            "birthday": birthdayTextField.text ?? "",
            "sex": sexTextField.text ?? "",
            "other_email": otherMailTextField.text ?? "",
            "nation": nationTextField.text ?? "",
            "address": addressTextField.text ?? ""
        ]
        EditInfoRequest.shared.editInfo(param) {
            self.isSuccessEdit = $0
            self.isConnect = $1
            if self.isConnect {
                if self.isSuccessEdit {
                    self.createAlert(title: NSLocalizedString(Constant.Alert.alertTitle, comment: ""),
                                     message: NSLocalizedString(Constant.Alert.editInfoSuccess, comment: ""))
                } else {
                    self.createAlert(title: NSLocalizedString(Constant.Alert.alertTitle, comment: ""),
                                     message: NSLocalizedString(Constant.Alert.editInfoFail, comment: ""))
                }
            } else {
                self.createAlert(title: NSLocalizedString(Constant.Alert.alertTitle, comment: ""),
                                 message: NSLocalizedString(Constant.Alert.internetError, comment: ""))
            }
        }
    }
    
    func checkInfoChange() -> Bool {
        if fullnameTextField.text != fullnameValue ||
            birthdayTextField.text != birthdayValue ||
            sexTextField.text != sexValue ||
            otherMailTextField.text != otherMailValue ||
            nationTextField.text != nationValue ||
            addressTextField.text != addressValue {
            return true
        } else {
            return false
        }
    }
    
    func confirmChangeInfo() {
        let alert = UIAlertController(title: NSLocalizedString(Constant.Alert.alertTitle, comment: ""),
                                      message: NSLocalizedString(Constant.Alert.editInfo, comment: ""),
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString(Constant.Alert.alertNO, comment: ""),
                                      style: .cancel) { (_) in
                                        alert.dismiss(animated: true, completion: nil)
        })
        alert.addAction(UIAlertAction(title: NSLocalizedString(Constant.Alert.alertOK, comment: ""),
                                      style: .default) { (_) in
                                        alert.dismiss(animated: true, completion: nil)
                                        self.requestEditInfo()
        })
        self.present(alert, animated: true, completion: nil)
    }
}

extension EditStudentInfo: StoryboardSceneBased {
    static let sceneStoryboard = Storyboards.account
}
