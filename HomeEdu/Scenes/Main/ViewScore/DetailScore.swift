//
//  DetailScore.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 8/19/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import UIKit
import Reusable

final class DetailScore: UIViewController {
    @IBOutlet weak var midScoreLabel: UILabel!
    @IBOutlet weak var finalScoreLabel: UILabel!
    @IBOutlet weak var totalScoreLabel: UILabel!
    var midScore: Double?
    var finalScore: Double?
    var totalScore: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDataDetailScore()
    }
    
    func setDataDetailScore() {
        midScoreLabel.text = String(format:"%.1f", midScore ?? 0)
        finalScoreLabel.text = String(format:"%.1f", finalScore ?? 0)
        totalScoreLabel.text = String(format:"%.1f", totalScore ?? 0)
    }
    
    @IBAction func buttonBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension DetailScore: StoryboardSceneBased {
    static let sceneStoryboard = Storyboards.viewScore
}
