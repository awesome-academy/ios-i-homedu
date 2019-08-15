//
//  ScoreViewController.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 8/7/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {

    @IBOutlet weak var viewEachTerm: UIView!
    @IBOutlet weak var viewAllScore: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func switchViewScore(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            viewEachTerm.alpha = 0
            viewAllScore.alpha = 1
        } else {
            viewEachTerm.alpha = 1
            viewAllScore.alpha = 0
        }
    }
}
