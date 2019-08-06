//
//  AboutHomeEdu.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 8/6/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import UIKit
import Reusable

class AboutHomeEdu: UIViewController {
    
    @IBOutlet weak var aboutVersion: UILabel!
    @IBOutlet weak var aboutContact: UILabel!
    @IBOutlet weak var aboutAuthor: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutVersion.text = NSLocalizedString(Constant.AboutHomedu.version,
                                              comment: "")
        aboutContact.text = NSLocalizedString(Constant.AboutHomedu.contact,
                                              comment: "")
        aboutAuthor.text = NSLocalizedString(Constant.AboutHomedu.author,
                                             comment: "")
    }
    
    @IBAction func buttonBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension AboutHomeEdu: StoryboardSceneBased {
    static let sceneStoryboard = Storyboards.about
}
