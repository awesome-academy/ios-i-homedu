//
//  LearningScheduleController.swift
//  HomeEdu
//
//  Created by Minh Mon on 8/9/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import UIKit
import MBCalendarKit
import SAProgressHUB
import Then

final class LearningScheduleController: UIViewController {
    @IBOutlet weak var calendarView: CustomCalendarView!
    @IBOutlet weak var timeScheduleTable: UITableView!
    
    private var weekdayCalendarView = 2
    private var dayScheduleForTable = [DaySchedule]()
    private var refreshControl = UIRefreshControl()
    private let loading = SAProgressHUB(type: .lottie, style: .blurBackground)
    
    enum Constants {
        static let learningCellHeight: CGFloat = 116
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableAndRefreshControl()
        getScheduleAtFirstTime()
    }
    
    func getScheduleAtFirstTime() {
        showIndicator(hub: loading)
        getLearningSchedule { [unowned self] in
            self.hideIndicator(hub: self.loading)
        }
    }
    
    func getCurrentWeekday() {
        let now = Date()
        let calendar = Calendar.current
        weekdayCalendarView = calendar.component(.weekday, from: now)
        timeScheduleTable.reloadData()
    }
    
    func registerTableAndRefreshControl() {
        calendarView.do {
            $0.delegate = self
        }
        refreshControl.do {
            $0.attributedTitle = NSAttributedString(string: Constant.reloadTitle)
            $0.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        }
        timeScheduleTable.do {
            $0.delegate = self
            $0.dataSource = self
            $0.register(cellType: LearningScheduleCell.self)
            $0.addSubview(refreshControl)
        }
    }
    
    @objc func refresh() {
        getLearningSchedule { [unowned self] in
            self.refreshControl.endRefreshing()
        }
    }
    
    func getLearningSchedule(completion: @escaping () -> Void) {
        APIServices.getInformation(url: Urls.learningScheduleUrl) { (response: Response<LearningSchedule>) in
            guard let data = response.data, !data.isEmpty else { return }
            let daySchedules = data[0].days
            for day in daySchedules {
                self.dayScheduleForTable.append(day)
            }
            self.getCurrentWeekday()
            completion()
        }
    }
    
    func getSubjects() -> [TimeSchedule] {
        let none = [TimeSchedule]()
        for day in dayScheduleForTable {
            guard let weekday = day.weekday else { return none }
            let subjects = day.subjects
            if weekday == weekdayCalendarView {
                return subjects
            }
        }
        return none
    }
}

extension LearningScheduleController: UITableViewDataSource, UITableViewDelegate {    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getSubjects().count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.learningCellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as LearningScheduleCell
        let row = indexPath.row
        cell.setDataForCell(timeSchedule: getSubjects()[row])
        return cell
    }
}

extension LearningScheduleController: CalendarViewDelegate {
    func calendarView(_ calendarView: CalendarView, didSelect date: Date) {
        let center = Calendar.current
        weekdayCalendarView = center.component(.weekday, from: date)
        timeScheduleTable.reloadData()
    }
}
