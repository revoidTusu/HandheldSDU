//
//  MyTabBarController.swift
//  ZDSDU
//
//  Created by Nanfo_Fhzh on 15/11/11.
//  Copyright © 2015年 Nanfo_Fhzh. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {

    
    var _seatViewCtrl:SeatViewController!//查找座位试图控制器
    var _bookViewCtrl:BookViewController!//查找书籍
    var _aboutViewCtrl:UserViewController!//关于我们
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        initView()
        
        tabBarCtrl  = self
        
        self.selectedIndex = 0
        self.setNeedsFocusUpdate()//更新焦点
        
        print(_seatViewCtrl)
        print(_bookViewCtrl)
        print(_aboutViewCtrl)
        

        
        
    }
    
    
    func initView()
    {
        self.view.backgroundColor = UIColor.whiteColor()
        //各视图初始化
        _aboutViewCtrl =  UserViewController()
        _bookViewCtrl  =  BookViewController()
        
        _seatViewCtrl  =  SeatViewController()
        
        //tabitem初始化
        seatBarItem    = UITabBarItem.init(title: "查座预约", image: UIImage(named: "img_seat"), selectedImage: UIImage(named: "img_seatClicked"))
        
        
        bookBarItem    = UITabBarItem.init(title: "找书", image: UIImage(named: "img_book"), selectedImage: UIImage(named: "img_bookClicked"))
        
        
        aboutBarItem   = UITabBarItem.init(title: "个人中心", image: UIImage(named: "img_user"), selectedImage: UIImage(named: "img_aboutClicked"))
        
        
        _seatViewCtrl.tabBarItem  = seatBarItem
        _bookViewCtrl.tabBarItem  = bookBarItem
        _aboutViewCtrl.tabBarItem = aboutBarItem
        
        
        self.tabBar.barTintColor = UIColor.whiteColor()
        
        self.viewControllers=[_seatViewCtrl!, _bookViewCtrl!, _aboutViewCtrl!]
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidLoad()
        
        
        
        
    }
    
    
    
    
    
    
    

    
}
