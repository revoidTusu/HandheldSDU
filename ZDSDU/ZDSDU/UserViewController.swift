//
//  UserViewController.swift
//  ZDSDU
//
//  Created by Nanfo_Fhzh on 15/11/11.
//  Copyright © 2015年 Nanfo_Fhzh. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    var btn_showlogin:UIButton!//显示登录状态及学号
    
    var btn_order:UIButton!//预约记录
    var btn_map:UIButton!//借书路线
    var btn_about:UIButton!//关于我们

    var btn_dologin:UIButton!//login
    var tv_btn:UILabel!
    var tv_showlogin:UILabel!
    var tv_login:UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        initView()
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        print(userinfo.islogin)

 
          if userinfo.islogin == true
            {
                tv_showlogin.text="学号 \(userinfo.userNumber) \(userinfo.userName)"
                tv_login.text="退出登录"
            }
            else
            {
                tv_showlogin.text="未登录"
                tv_login.text="登录"

            }
        
        
        tv_showlogin.setNeedsDisplay()
    
    }
    
    
    func initView()
    {
        imgView_bg = UIImageView()
        imgView_bg.frame = CGRect(x: toX(0), y: 0, width: toWidth(375), height: toHeight(73))
        imgView_bg.contentMode = .ScaleAspectFill
        imgView_bg.image = UIImage.init(named: "img_bg")
        self.view.addSubview(imgView_bg)
        
        tv_title = UILabel()
        tv_title.frame = CGRect(x: toX(114), y: toY(33), width: toWidth(147), height: toHeight(28))
        tv_title.text = "个人中心"
        tv_title.textAlignment = .Center
        tv_title.font = UIFont(name: "Helvetica", size: 20)
        self.view.addSubview(tv_title)
        
        btn_showlogin=UIButton.init(type: .Custom)
        tv_showlogin=UILabel()
        tv_showlogin.text = "未登录"
        tv_showlogin.frame = CGRect(x: toX(22), y: toY(11), width: toWidth(331), height: toHeight(28))
        tv_showlogin.hidden = false
        tv_showlogin.textAlignment = .Left
        tv_showlogin.textColor = UIColor.blackColor()
        btn_showlogin.addSubview(tv_showlogin)
        btn_showlogin.adjustsImageWhenHighlighted=false
        btn_showlogin.addTarget(self, action: "btn_showloginClicked", forControlEvents: .TouchUpInside)
        btn_showlogin.frame = CGRect(x: toX(-1), y: toY(84), width: toWidth(376), height: toHeight(52))
        btn_showlogin.setBackgroundImage(UIImage(named: "img_btn"), forState: .Normal)
        btn_showlogin.contentMode = .ScaleAspectFill
        self.view.addSubview(btn_showlogin)
        
        
        
        btn_order=UIButton.init(type: .Custom)
        tv_btn=UILabel()
        tv_btn.text = "预约记录"
        tv_btn.frame = CGRect(x: toX(22), y: toY(11), width: toWidth(331), height: toHeight(28))
        tv_btn.hidden = false
        tv_btn.textAlignment = .Left
        tv_btn.textColor = UIColor.blackColor()
        btn_order.addSubview(tv_btn)
        btn_order.adjustsImageWhenHighlighted=false
        btn_order.addTarget(self, action: "btn_orderClicked", forControlEvents: .TouchUpInside)
        btn_order.frame = CGRect(x: toX(-1), y: toY(159), width: toWidth(376), height: toHeight(52))
        btn_order.setBackgroundImage(UIImage(named: "img_btn"), forState: .Normal)
        btn_order.contentMode = .ScaleAspectFill
        self.view.addSubview(btn_order)
        
        
        
        btn_map=UIButton.init(type: .Custom)
        tv_btn=UILabel()
        tv_btn.text = "借书路线收藏"
        tv_btn.frame = CGRect(x: toX(22), y: toY(11), width: toWidth(331), height: toHeight(28))
        tv_btn.hidden = false
        tv_btn.textColor = UIColor.blackColor()
        tv_btn.textAlignment = .Left
        btn_map.addSubview(tv_btn)
        btn_map.adjustsImageWhenHighlighted=false
        btn_map.addTarget(self, action: "btn_mapClicked", forControlEvents: .TouchUpInside)
        btn_map.frame = CGRect(x: toX(-1), y: toY(210), width: toWidth(376), height: toHeight(52))
        btn_map.setBackgroundImage(UIImage(named: "img_btn"), forState: .Normal)
        btn_map.contentMode = .ScaleAspectFill
        self.view.addSubview(btn_map)
        
        
        btn_about=UIButton.init(type: .Custom)
        tv_btn=UILabel()
        tv_btn.text = "关于我们"
        tv_btn.frame = CGRect(x: toX(22), y: toY(11), width: toWidth(331), height: toHeight(28))
        tv_btn.hidden = false
        tv_btn.textAlignment = .Left
        tv_btn.textColor = UIColor.blackColor()
        btn_about.addSubview(tv_btn)
        btn_about.adjustsImageWhenHighlighted=false
        btn_about.addTarget(self, action: "btn_aboutClicked", forControlEvents: .TouchUpInside)
        btn_about.frame = CGRect(x: toX(-1), y: toY(261), width: toWidth(376), height: toHeight(52))
        btn_about.setBackgroundImage(UIImage(named: "img_btn"), forState: .Normal)
        btn_about.contentMode = .ScaleAspectFill
        self.view.addSubview(btn_about)
        
        btn_dologin=UIButton.init(type: .Custom)
        tv_login=UILabel()
        tv_login.text = "登录"
        tv_login.frame = CGRect(x: toX(22), y: toY(11), width: toWidth(331), height: toHeight(28))
        tv_login.hidden = false
        tv_login.textAlignment = .Center
        tv_login.textColor = UIColor.blackColor()
        btn_dologin.addSubview(tv_login)
        btn_dologin.adjustsImageWhenHighlighted=false
        btn_dologin.addTarget(self, action: "btn_dologinClicked", forControlEvents: .TouchUpInside)
        btn_dologin.frame = CGRect(x: toX(-1), y: toY(432), width: toWidth(375), height: toHeight(52))
        btn_dologin.setBackgroundImage(UIImage(named: "img_btn"), forState: .Normal)
        btn_dologin.contentMode = .ScaleAspectFill
        self.view.addSubview(btn_dologin)
        
    }
    
    func btn_showloginClicked()
    {
        print("btn_showloginClicked")
    }
    
    
    func btn_orderClicked()
    {
        print("btn_orderClicked")
    }
    
    
    
    func btn_mapClicked()
    {
        print("btn_mapClicked")
    }
    
    
    
    func btn_aboutClicked()
    {
        print("btn_aboutClicked")
    }
    
    
    func btn_dologinClicked()
    {
        print("btn_dologinClicked")
        loginViewCtrl = LoginViewController()
        self.navigationController?.pushViewController(loginViewCtrl, animated: false)
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
