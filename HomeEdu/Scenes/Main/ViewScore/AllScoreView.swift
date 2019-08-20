//
//  AllScoreView.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 8/19/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import UIKit
import Alamofire
import Reusable
import SAProgressHUB

final class AllScoreView: UIViewController {
    @IBOutlet weak private var gpaLabel: UILabel!
    @IBOutlet weak private var creditLabel: UILabel!
    @IBOutlet weak var allScoreTableView: UITableView!
    private var saveTerm = [ScoreTerm]()
    var loading = SAProgressHUB(type: .lottie, style: .blurBackground)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        getPointAtFirstTime()
    }
    
    func getPointAtFirstTime() {
        showIndicator(hub: loading)
        getScoreTerm { [unowned self] in
            self.hideIndicator(hub: self.loading)
            self.allScoreTableView.reloadData()
        }
    }
    
    func configView() {
        allScoreTableView.register(cellType: AllScoreCell.self)
        allScoreTableView.delegate = self
        allScoreTableView.dataSource = self
    }
    
    func getScoreTerm(completion: @escaping () -> Void) {
        APIServices.getInformation(url: Urls.urlViewScore) { (response: Response<ScoreData>) in
            guard let data = response.data, !data.isEmpty else { return }
            guard let gpa = data[0].totalGpa, let creditValue = data[0].totalCredit else { return }
            self.setGeneralScoreInfo(gpa: gpa, credit: creditValue)
            let terms = data[0].terms
            for term in terms {
                self.saveTerm.append(term)
            }
            completion()
        }
    }
    
    func setGeneralScoreInfo(gpa: Double, credit: Int) {
        gpaLabel.text = "\(gpa)"
        creditLabel.text = "\(credit)"
    }
}

extension AllScoreView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return saveTerm.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return saveTerm[section].title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let subjects = saveTerm[section].subjects
        return subjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AllScoreCell = tableView.dequeueReusableCell(for: indexPath)
        let section = indexPath.section
        let row = indexPath.row
        let subjects = saveTerm[section].subjects
        let subject = subjects[row]
        cell.setDataForCell(scoreSubject: subject)
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let section = indexPath.section
        let row = indexPath.row
        let subjects = saveTerm[section].subjects 
        let subject = subjects[row]
        let detailScore = DetailScore.instantiate()
        detailScore.midScore = subject.midtermScore
        detailScore.finalScore = subject.finalScore
        detailScore.totalScore = subject.totalScore
        self.navigationController?.pushViewController(detailScore, animated: true)
    }
}
