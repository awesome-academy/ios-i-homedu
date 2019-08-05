//
//  AboutViewController.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 8/5/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonAboutApp(_ sender: Any) {
        let aboutSB = Storyboards.about
        let about = aboutSB.instantiateViewController(withIdentifier: "AboutHomeEdu")
        self.navigationController?.pushViewController(about, animated: true)
    }
    @IBAction func buttonLogout(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
