//
//  InformationStudent.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 7/25/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import UIKit

class InformationStudent: UIViewController {
    var _section : Int?
    let infoStudentCell = "InfoStudent"
    let thongtinsinhvien = ["Mã sinh viên:", "Họ và tên:", "Ngày sinh:", "Giới tính:", "VNU mail:", "Mail khác:"]
    let thongtinnhaphoc = ["Chương trình đào tạo:", "Lớp quản lý:"]
    let quequan = ["Quốc tịch:", "Địa chỉ:"]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("abc")
        tableView.register(UINib.init(nibName: infoStudentCell, bundle: nil), forCellReuseIdentifier: infoStudentCell)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension InformationStudent: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Thông tin sinh viên"
        case 1: return "Thông tin nhập học"
        case 2: return "Quê quán"
        default:
            return "Section"
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 6
        case 1: return 2
        case 2: return 2
        default:
            return 1
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: infoStudentCell, for: indexPath) as! InfoStudent
        if (indexPath.section == 0){
            cell.test.text = thongtinsinhvien[indexPath.row]
            cell.info.text = SaveData.thongtinSV[indexPath.row]
        } else if (indexPath.section == 1) {
            cell.test.text = thongtinnhaphoc[indexPath.row]
            cell.info.text = SaveData.thongtinDT[indexPath.row]
        } else if (indexPath.section == 2) {
            cell.test.text = quequan[indexPath.row]
            cell.info.text = SaveData.thongtinQQ[indexPath.row]
        }
        return cell
    }
}
