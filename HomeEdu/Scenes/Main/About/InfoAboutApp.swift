//
//  InfoAboutApp.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 8/5/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import UIKit

class InfoAboutApp: UIViewController {

    @IBOutlet weak var version: UILabel!
    @IBOutlet weak var contact: UILabel!
    @IBOutlet weak var author: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        version.text = Vietnamese.AboutApp.version
        contact.text = Vietnamese.AboutApp.contact
        author.text = Vietnamese.AboutApp.author
    }
    
    @IBAction func buttonBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
