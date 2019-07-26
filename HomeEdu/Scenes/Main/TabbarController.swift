//
//  TabbarController.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 7/26/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import UIKit

class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("DCDCDCDC")
        setuo()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setuo(){
        let taikhoan = Storyboards.Taikhoan
        let lichthi = Storyboards.Lichthi
        let tkb = Storyboards.Tkb
        let xemdiem = Storyboards.Xemdiem
        let about = Storyboards.About
        
        let taikhoan_controller = taikhoan.instantiateViewController(withIdentifier: "taikhoan")
        let lichthi_controller = lichthi.instantiateViewController(withIdentifier: "lichthi")
        let tkb_controller = tkb.instantiateViewController(withIdentifier: "tkb")
        let xemdiem_controller = xemdiem.instantiateViewController(withIdentifier: "xemdiem")
        let about_controller = about.instantiateViewController(withIdentifier: "about")

        xemdiem_controller.tabBarItem = UITabBarItem(title: "Xem điểm", image: nil, tag: 0)
        tkb_controller.tabBarItem = UITabBarItem(title: "TKB", image: nil, tag: 1)
        taikhoan_controller.tabBarItem = UITabBarItem(title: "Tài khoản", image: nil, tag: 2)
        lichthi_controller.tabBarItem = UITabBarItem(title: "Lịch thi", image: nil, tag: 3)
        about_controller.tabBarItem = UITabBarItem(title: "About", image: nil, tag: 4)
        self.viewControllers = [xemdiem_controller, tkb_controller, taikhoan_controller, lichthi_controller, about_controller]
        
    }
    


}
