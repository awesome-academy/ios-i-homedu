//
//  scoreProgressView.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 8/15/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import UIKit
import Reusable
import SAProgressHUB

class ScoreProgressView: UIViewController {
    @IBOutlet weak var scoreProgressTableView: UITableView!
    private var saveScoreProgess = [ScoreProgressValue]()
    var loading = SAProgressHUB(type: .lottie, style: .blurBackground)
    enum Constant {
        static let heightCell: CGFloat = 145
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        getPointAtFirstTime()
    }
    
    func configView() {
        scoreProgressTableView.register(cellType: ScoreProgessCell.self)
        scoreProgressTableView.delegate = self
        scoreProgressTableView.dataSource = self
    }
    
    func getPointAtFirstTime() {
        showIndicator(hub: loading)
        getScoreProgess { [unowned self] in
            self.hideIndicator(hub: self.loading)
            self.scoreProgressTableView.reloadData()
        }
    }
    
    func getScoreProgess(callback: @escaping () -> Void) {
        APIServices.getInformation(url: Urls.urlViewScoreProgess) { (response: Response<ScoreProgress>) in
            guard let data = response.data, !data.isEmpty else { return }
            guard let terms = data[0].terms, !terms.isEmpty else { return }
            for term in terms {
                self.saveScoreProgess.append(term)
            }
            callback()
        }
    }
}

extension ScoreProgressView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return saveScoreProgess.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constant.heightCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ScoreProgessCell = tableView.dequeueReusableCell(for: indexPath)
        let row = indexPath.row
        cell.setDataForCell(saveScoreProgess[row])
        return cell
    }
}
