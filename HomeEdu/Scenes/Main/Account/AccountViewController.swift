//
//  AccountViewController.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 8/7/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import UIKit
import Reusable

class AccountViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "InfoStudentCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "InfoStudentCell")
        tableView.delegate = self
        tableView.dataSource = self
        GetCoreData.shared.getInfoAccount()
    }
}

extension AccountViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return Constant.InfoAccount.infoStudentTitle
        case 1: return Constant.InfoAccount.infoClasstTitle
        case 2: return Constant.InfoAccount.infoAdressTitle
        default:
            return "Section"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(Constant.InfoAccount.heightSection)
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
        let cell: InfoStudentCell = tableView.dequeueReusableCell(for: indexPath)
        if indexPath.section == 0 {
            cell.infoType?.text = Constant.InfoAccount.infoStudent[indexPath.row]
            cell.infoValue?.text = GetCoreData.shared.infoStudentValue[indexPath.row]
        } else if indexPath.section == 1 {
            cell.infoType?.text = Constant.InfoAccount.infoClass[indexPath.row]
            cell.infoValue?.text = GetCoreData.shared.infoClassValue[indexPath.row]
        } else if indexPath.section == 2 {
            cell.infoType?.text = Constant.InfoAccount.infoAdress[indexPath.row]
            cell.infoValue?.text = GetCoreData.shared.infoAddressValue[indexPath.row]
        }
        return cell
    }
}
