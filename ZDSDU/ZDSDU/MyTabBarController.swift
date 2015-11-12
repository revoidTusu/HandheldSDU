//
//  MyTabBarController.swift
//  ZDSDU
//
//  Created by Nanfo_Fhzh on 15/11/11.
//  Copyright © 2015年 Nanfo_Fhzh. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        initView()
        
        tabBarCtrl  = self
        
        self.selectedIndex = 0
        self.setNeedsFocusUpdate()//更新焦点
        
        print(seatViewCtrl)
        print(bookViewCtrl)
        print(aboutViewCtrl)
        
        seatViewCtrl.collectionView.dataSource = seatViewCtrl.self
        seatViewCtrl.collectionView.setNeedsDisplay()

    }
    
    
    func initView()
    {
        self.view.backgroundColor = UIColor.whiteColor()
        //各视图初始化
        
        aboutViewCtrl =  UserViewController()
        bookViewCtrl  =  BookViewController()
        
        seatViewCtrl  =  SeatViewController()
        
        
        
        userNaviCtrl = UINavigationController()
        userNaviCtrl.addChildViewController(aboutViewCtrl)
        userNaviCtrl.setNavigationBarHidden(true, animated: true)
        
        
 
        
        //tabitem初始化
        seatBarItem    = UITabBarItem.init(title: "查座预约", image: UIImage(named: "img_seat"), selectedImage: UIImage(named: "img_seatClicked"))
        
        
        bookBarItem    = UITabBarItem.init(title: "找书", image: UIImage(named: "img_book"), selectedImage: UIImage(named: "img_bookClicked"))
        
        
        aboutBarItem   = UITabBarItem.init(title: "个人中心", image: UIImage(named: "img_user"), selectedImage: UIImage(named: "img_aboutClicked"))
        
        
        seatViewCtrl.tabBarItem  = seatBarItem
        bookViewCtrl.tabBarItem  = bookBarItem
        
        userNaviCtrl.tabBarItem = aboutBarItem
        
        
        self.tabBar.barTintColor = UIColor.whiteColor()
        self.viewControllers=[seatViewCtrl!, bookViewCtrl!, userNaviCtrl!]
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidLoad()
        
        
        
        
    }
    
    
    
    
    
    
    

    
}
