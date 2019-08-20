//
//  ExamScheduleController.swift
//  HomeEdu
//
//  Created by Minh Mon on 8/6/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import Reusable
import SAProgressHUB

class ExamScheduleController: UIViewController {
    
    @IBOutlet weak private var studentNameLabel: UILabel!
    @IBOutlet weak private var studentIdLabel: UILabel!
    @IBOutlet weak private var termLabel: UILabel!
    @IBOutlet weak private var amountOfSubjectLabel: UILabel!
    @IBOutlet weak private var examScheduleTable: UITableView!
    private var subjectSchedules = [SubjectSchedule]()
    private var refreshControl = UIRefreshControl()
    private let loading = SAProgressHUB(type: .lottie, style: .blurBackground)
    
    enum Constants {
        static let examCellHeight: CGFloat = 151
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableAndRefreshControl()
        getScheduleAtFirstTime()
    }
    
    func registerTableAndRefreshControl() {
        examScheduleTable.delegate = self
        examScheduleTable.dataSource = self
        examScheduleTable.register(cellType: ExamScheduleCell.self)
        
        refreshControl.attributedTitle = NSAttributedString(string: Constant.reloadTitle)
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        examScheduleTable.addSubview(refreshControl)
    }
    
    @objc func refresh() {
        getExamSchedule { [unowned self] in
            self.refreshControl.endRefreshing()
        }
    }
    
    func getScheduleAtFirstTime() {
        showIndicator(hub: loading)
        getExamSchedule { [unowned self] in
            self.hideIndicator(hub: self.loading)
        }
    }
    
    func getExamSchedule(callback: @escaping () -> Void) {
        APIServices.getInformation(url: Urls.examScheduleUrl) { (response: Response<ExamSchedule>) in
            guard let data = response.data, !data.isEmpty else { return }
            var subjectScheduleTemp = [SubjectSchedule]()
            guard let examSchedules = data[0].examSchedule else { return }
            for subject in examSchedules {
                subjectScheduleTemp.append(subject)
            }
            self.subjectSchedules = subjectScheduleTemp
            self.examScheduleTable.reloadData()
            callback()
        }
    }
}

extension ExamScheduleController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjectSchedules.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.examCellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as ExamScheduleCell
        let row = indexPath.row
        cell.setDataForCell(subjectSchedule: subjectSchedules[row])
        return cell
    }
}
