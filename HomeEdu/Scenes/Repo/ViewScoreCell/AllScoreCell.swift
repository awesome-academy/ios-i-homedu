//
//  AllScoreCell.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 8/19/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import UIKit
import Reusable

final class AllScoreCell: UITableViewCell, NibReusable {
    @IBOutlet weak var nameSubjectLabel: UILabel!
    @IBOutlet weak var codeSubjectLabel: UILabel!
    @IBOutlet weak var numberCreditLabel: UILabel!
    @IBOutlet weak var scoreNumberLabel: UILabel!
    @IBOutlet weak var scoreWordLabel: UILabel!
    @IBOutlet weak var wordScoreView: UIView!
    
    func setDataForCell(scoreSubject: ScoreSubject) {
        nameSubjectLabel.text = scoreSubject.name
        codeSubjectLabel.text = scoreSubject.id
        numberCreditLabel.text = "\(scoreSubject.credit ?? 0)"
        scoreNumberLabel.text = "\(scoreSubject.gpa ?? 0)"
        let (word, colerScore) = convertScore(score: scoreSubject.gpa ?? 0)
        scoreWordLabel.text = word
        wordScoreView.backgroundColor = colerScore
    }
    
    func convertScore(score: Double) -> (word: String, colorScore: UIColor){
        switch score {
        case 4:
            return ("A+", #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1))
        case 3.7:
            return ("A", #colorLiteral(red: 0.5563425422, green: 0.9793455005, blue: 0, alpha: 1))
        case 3.5:
            return ("B+", #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
        case 3:
            return ("B", #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1))
        case 2.5:
            return ("C+", #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))
        case 2:
            return ("C", #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1))
        case 1.5:
            return ("D+", #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))
        case 1:
            return ("D", #colorLiteral(red: 0.9085512757, green: 0.2707546949, blue: 0.1309389472, alpha: 1))
        case 0:
            return ("F", #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1))
        default:
            return ("", #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        }
    }
}

