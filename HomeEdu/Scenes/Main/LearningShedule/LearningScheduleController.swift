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

class LearningScheduleController: UIViewController {
    
    private var weekdayCalendarView = 2
    private var dayScheduleForTable = [DaySchedule]()
    @IBOutlet weak var calendarView: CustomCalendarView!
    @IBOutlet weak var timeScheduleTable: UITableView!
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
        getLearningSchedule { [unowned self ] in
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
        calendarView.delegate = self
        timeScheduleTable.delegate = self
        timeScheduleTable.dataSource = self
        timeScheduleTable.register(cellType: LearningScheduleCell.self)
        
        refreshControl.attributedTitle = NSAttributedString(string: Constant.reloadTitle)
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        timeScheduleTable.addSubview(refreshControl)
    }
    
    @objc func refresh() {
        getLearningSchedule { [unowned self] in
            self.refreshControl.endRefreshing()
        }
    }
    
    func getLearningSchedule(callback: @escaping () -> Void) {
        APIServices.getInformation(url: Urls.learningScheduleUrl) { (response: Response<LearningSchedule>) in
            guard let data = response.data, !data.isEmpty else { return }
            guard let daySchedules = data[0].days else { return }
            for day in daySchedules {
                self.dayScheduleForTable.append(day)
            }
            self.getCurrentWeekday()
            callback()
        }
    }
    
    func getSubjects() -> [TimeSchedule] {
        let none = [TimeSchedule]()
        for day in dayScheduleForTable {
            guard let weekday = day.weekday, let subjects = day.subjects else { return none }
            if weekday == weekdayCalendarView {
                return subjects
            }
        }
        return none
    }
}

extension LearningScheduleController: CalendarViewDelegate, UITableViewDataSource, UITableViewDelegate {
    func calendarView(_ calendarView: CalendarView, didSelect date: Date) {
        let center = Calendar.current
        weekdayCalendarView = center.component(.weekday, from: date)
        timeScheduleTable.reloadData()
    }
    
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
