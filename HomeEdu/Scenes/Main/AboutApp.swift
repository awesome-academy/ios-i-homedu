//
//  AboutApp.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 7/26/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import UIKit

class AboutApp: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func AboutApp(_ sender: Any) {
        
    }
    @IBAction func logout(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
