//
//  AboutViewController.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 8/6/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import UIKit
import Reusable

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationBar()
    }
    
    @IBAction func buttonAbout(_ sender: Any) {
        let about = AboutHomeEdu.instantiate()
        self.navigationController?.pushViewController(about, animated: true)
    }
    
    @IBAction func buttonLogout(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
