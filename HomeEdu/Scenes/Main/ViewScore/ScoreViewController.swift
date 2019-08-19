//
//  ScoreViewController.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 8/7/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import UIKit

final class ScoreViewController: UIViewController {

    @IBOutlet weak private var viewEachTerm: UIView!
    @IBOutlet weak private var viewAllScore: UIView!
    
    @IBAction func switchViewScore(_ sender: UISegmentedControl) {
        viewEachTerm.alpha = sender.selectedSegmentIndex == 0 ? 0 : 1
        viewAllScore.alpha = sender.selectedSegmentIndex == 0 ? 1 : 0
    }
}
