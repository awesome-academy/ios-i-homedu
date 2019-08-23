//
//  StudentInfoController.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 8/19/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import UIKit
import Reusable
import SAProgressHUB

final class StudentInfoController: UIViewController {
    
    @IBOutlet weak private var studentInfoTable: UITableView!
    var loading = SAProgressHUB(type: .lottie, style: .blurBackground)
    private var studentInfoValue = [String]()
    private var classInfoValue = [String]()
    private var addressInfoValue = [String]()
    private var infoStudent: InfoAccount?
    private let editInfoView = EditStudentInfo.instantiate()
    
    enum SectionInfo {
        static let heightSection: CGFloat = 40
        static let numberOfSection = 3
        static let sectionInfoStudent = 0
        static let sectionClass = 1
        static let sectionAdress = 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPointAtFirstTime()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if editInfoView.isChange {
            studentInfoValue.removeAll()
            classInfoValue.removeAll()
            addressInfoValue.removeAll()
            getPointAtFirstTime()
            editInfoView.isChange = false
        }
    }
    
    private func configView() {
        studentInfoTable.register(cellType: StudentInfoCell.self)
        studentInfoTable.delegate = self
        studentInfoTable.dataSource = self
        studentInfoTable.reloadData()
    }
    
    func getPointAtFirstTime() {
        showIndicator(hub: loading)
        getInfoStudent { [unowned self] in
            self.configView()
            self.hideIndicator(hub: self.loading)
        }
    }
    
    func getInfoStudent(completion: @escaping () -> Void) {
        APIServices.getInformation(url: Urls.urlInfoStudent) { (response: Response<InfoAccount>) in
            guard let data = response.data, !data.isEmpty else { return }
            let result = data[0]
            self.infoStudent = result
            self.studentInfoValue.append(result.studentId)
            self.studentInfoValue.append(result.fullName)
            self.studentInfoValue.append(result.birthday)
            self.studentInfoValue.append(result.sex)
            self.studentInfoValue.append(result.vnuMail)
            self.studentInfoValue.append(result.otherMail)
            self.classInfoValue.append(result.programType)
            self.classInfoValue.append(result.classStudent)
            self.addressInfoValue.append(result.nation)
            self.addressInfoValue.append(result.address)
            completion()
        }
    }
    
    @IBAction func buttonEditInfo(_ sender: Any) {
        editInfoView.studentInfoChange = infoStudent
        self.navigationController?.pushViewController(editInfoView, animated: true)
    }
}

extension StudentInfoController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return SectionInfo.numberOfSection
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case SectionInfo.sectionInfoStudent:
            return Constant.Information.infoStudentTitle
        case SectionInfo.sectionClass:
            return Constant.Information.infoClassTitle
        case SectionInfo.sectionAdress:
            return Constant.Information.infoAdressTitle
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return SectionInfo.heightSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let infoStudent = Constant.Information.infoStudent
        let infoClass = Constant.Information.infoClass
        let infoAdress = Constant.Information.infoAdress
        switch section {
        case SectionInfo.sectionInfoStudent:
            return infoStudent.count
        case SectionInfo.sectionClass:
            return infoClass.count
        case SectionInfo.sectionAdress:
            return infoAdress.count
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: StudentInfoCell = tableView.dequeueReusableCell(for: indexPath)
        let row = indexPath.row
        let sections = indexPath.section
        switch sections {
        case SectionInfo.sectionInfoStudent:
            cell.setUpInfo(infoStudent: Constant.Information.infoStudent[row],
                           infoValue: studentInfoValue[row])
        case SectionInfo.sectionClass:
            cell.setUpInfo(infoStudent: Constant.Information.infoClass[row],
                           infoValue: classInfoValue[row])
        case SectionInfo.sectionAdress:
            cell.setUpInfo(infoStudent: Constant.Information.infoAdress[row],
                           infoValue: addressInfoValue[row])
        default:
            cell.setUpInfo(infoStudent: "", infoValue: "")
        }
        return cell
    }
}
