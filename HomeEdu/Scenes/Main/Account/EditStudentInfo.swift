//
//  EditStudentInfo.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 8/21/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import UIKit
import Reusable
import Alamofire
import SAProgressHUB

class EditStudentInfo: UIViewController {
    @IBOutlet weak private var fullnameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak private var otherMailTextField: UITextField!
    @IBOutlet weak private var nationTextField: UITextField!
    @IBOutlet weak private var addressTextField: UITextField!
    @IBOutlet weak var checkBoxMale: UIButton!
    @IBOutlet weak var checkBoxFemale: UIButton!
    private var sexValueDefaul = ""
    private var sexValueChange = ""
    private var isSuccessEdit = false
    private var isConnect = false
    private let checkBoxImg = UIImage(named: Constant.Icon.checkBox)
    private let unCheckBoxImg = UIImage(named: Constant.Icon.unCheckBox)
    private var datePicker = UIDatePicker()
    var loading = SAProgressHUB(type: .lottie, style: .blurBackground)
    var studentInfoChange: InfoAccount?
    var isChange = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDatePicker()
        configView()
    }
    
    private func configInfo() {
        fullnameTextField.text = studentInfoChange?.fullName
        otherMailTextField.text = studentInfoChange?.otherMail
        nationTextField.text = studentInfoChange?.nation
        addressTextField.text = studentInfoChange?.address
        sexValueDefaul = studentInfoChange?.sex ?? ""
        birthdayTextField.text = studentInfoChange?.birthday ?? "0000-00-00"
        
        configCheckBoxGender()
    }
    
    private func configCheckBoxGender() {
        sexValueChange = sexValueDefaul
        if sexValueDefaul == Constant.Sex.male {
            checkBoxMale.setImage(checkBoxImg, for: .normal)
            checkBoxFemale.setImage(unCheckBoxImg, for: .normal)
        } else if sexValueDefaul == Constant.Sex.female {
            checkBoxMale.setImage(unCheckBoxImg, for: .normal)
            checkBoxFemale.setImage(checkBoxImg, for: .normal)
        } else {
            checkBoxMale.setImage(unCheckBoxImg, for: .normal)
            checkBoxFemale.setImage(unCheckBoxImg, for: .normal)
        }
    }
    
    private func configView() {
        configInfo()
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
        let dateFormat = Date()
        birthdayTextField.text = dateFormat.dateToString(datePicker.date)
        view.endEditing(true)
    }
    
    @IBAction func checkBoxMale(_ sender: Any) {
        checkBoxMale.setImage(checkBoxImg, for: .normal)
        checkBoxFemale.setImage(unCheckBoxImg, for: .normal)
        sexValueChange = Constant.Sex.male
    }
    
    @IBAction func checkBoxFemale(_ sender: Any) {
        checkBoxMale.setImage(unCheckBoxImg, for: .normal)
        checkBoxFemale.setImage(checkBoxImg, for: .normal)
        sexValueChange = Constant.Sex.female
    }
    
    @IBAction func buttonBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buttonSave(_ sender: Any) {
        if checkIfStudentInfoIsChange() {
            confirmChangeInfo()
        } else {
            self.createAlert(title: NSLocalizedString(Constant.Alert.alertTitle, comment: ""),
                             message: NSLocalizedString(Constant.Alert.editInfoError, comment: ""))
        }
    }
    
    func requestEditInfo(completion: @escaping () -> Void) {
        let paras = Param(fullname: fullnameTextField.text ?? "",
                            birthday: birthdayTextField.text ?? "",
                            sex: sexValueChange,
                            otherMail: otherMailTextField.text ?? "",
                            nation: nationTextField.text ?? "",
                            address: addressTextField.text ?? "")
        APIServices.putEditInfo(paras.exportToParameters()) {
            self.isConnect = $0
            self.isSuccessEdit = $1
            if self.isConnect {
                if self.isSuccessEdit {
                    self.createAlert(title: NSLocalizedString(Constant.Alert.alertTitle, comment: ""),
                                     message: NSLocalizedString(Constant.Alert.editInfoSuccess, comment: ""))
                    self.isChange = true
                } else {
                    self.createAlert(title: NSLocalizedString(Constant.Alert.alertTitle, comment: ""),
                                     message: NSLocalizedString(Constant.Alert.editInfoFail, comment: ""))
                }
            } else {
                self.internetNotConnect()
            }
            completion()
        }
    }
    
    func checkIfStudentInfoIsChange() -> Bool {
        var isInfoChange =  false
        if fullnameTextField.text != studentInfoChange?.fullName ||
            birthdayTextField.text != studentInfoChange?.birthday ||
            sexValueDefaul != sexValueChange ||
            otherMailTextField.text != studentInfoChange?.otherMail ||
            nationTextField.text != studentInfoChange?.nation ||
            addressTextField.text != studentInfoChange?.address {
            isInfoChange = true
        }
        return isInfoChange
    }
    
    func sendingRequestAnimation() {
        showIndicator(hub: loading)
        self.requestEditInfo { [unowned self] in
            self.configView()
            self.hideIndicator(hub: self.loading)
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
                                        self.sendingRequestAnimation()
        })
        self.present(alert, animated: true, completion: nil)
    }
}

extension EditStudentInfo: StoryboardSceneBased {
    static let sceneStoryboard = Storyboards.account
}
