//
//  UserViewController.swift
//  ZDSDU
//
//  Created by Nanfo_Fhzh on 15/11/11.
//  Copyright © 2015年 Nanfo_Fhzh. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        initView()
        
    }
    
    
    
    func initView()
    {
        imgView_bg = UIImageView()
        imgView_bg.frame = CGRect(x: 0, y: 0, width: toWidth(375), height: toHeight(73))
        imgView_bg.contentMode = .ScaleAspectFill
        imgView_bg.image = UIImage.init(named: "img_bg")
        self.view.addSubview(imgView_bg)
        
        tv_title = UILabel()
        tv_title.frame = CGRect(x: toX(114), y: toY(33), width: toWidth(147), height: toHeight(28))
        tv_title.text = "个人中心"
        tv_title.textAlignment = .Center
        tv_title.font = UIFont(name: "Helvetica", size: 20)
        self.view.addSubview(tv_title)
        
        
        
    }
}
