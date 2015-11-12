//
//  Common.swift
//  ZDSDU
//
//  Created by Nanfo_Fhzh on 15/11/11.
//  Copyright © 2015年 Nanfo_Fhzh. All rights reserved.
//

import Foundation
import UIKit

var naviCtrl:UINavigationController!
var isLogin:Bool=false
var userNaviCtrl:UINavigationController!//个人中心导航控制器
var loginViewCtrl:LoginViewController!

var tabBarCtrl:MyTabBarController!//主视图控制器


var aboutViewCtrl :UserViewController!
var bookViewCtrl  :BookViewController!

var seatViewCtrl  :SeatViewController!

//---------用户信息
var userinfo:UserInfo!


//---------座位信息
var seatInfo:[String]=[]
var onSeat:[String]=[]
var abreak:[String]=[]
var isfree:[String]=["","","","","","","","","","","",""]



var seatBarItem:UITabBarItem!//tabbar的各item
var bookBarItem:UITabBarItem!
var aboutBarItem:UITabBarItem!

var MyService:MyHttpService!

var imgView_bg:UIImageView!
var tv_title:UILabel!

var WIDTH:CGFloat!
var HEIGHT:CGFloat!




class MyCollectionViewCell:UICollectionViewCell {
    var tv:UILabel!
    var tv_allseat:UILabel!
    var tv_remainseat:UILabel!
    var tv_floor:String!
    
    var img_bg:UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clearColor()
        
        
        tv_allseat=UILabel()
        tv_allseat.frame=CGRect(x: toX(64), y: toY(44), width: toWidth(52), height: toHeight(21))
        tv_allseat.text = ""
        tv_allseat.textAlignment = .Center
        tv_allseat.font=UIFont(name: "Helvetica", size: 15)
        self.contentView.addSubview(tv_allseat)

        tv_remainseat = UILabel()
        tv_remainseat.frame=CGRect(x: toX(64), y: toY(14), width: toWidth(52), height: toHeight(21))
        tv_remainseat.text = ""
        tv_remainseat.textAlignment = .Center
        tv_remainseat.font=UIFont(name: "Helvetica", size: 15)
        self.contentView.addSubview(tv_remainseat)

        
        
    }
    
    
    override func drawRect(rect: CGRect) {
        
        
        StyleKitName.drawCanvas1(floorText: tv_floor)
        
        
    }
    
//    init(style: UITableViewCellStyle, reuseIdentifier: String?)
//    {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        
//        self.backgroundColor = UIColor.init(red: 35/255, green: 194/255, blue: 217/255, alpha: 100)
//        
//        tv=UILabel()
//        tv.frame=CGRect(x: toX(10), y: toY(8.5), width: toWidth(150), height: toHeight(20))
//        tv.textAlignment = .Left
//        tv.font=UIFont(name: "Helvetica", size: 20)
//        self.contentView.addSubview(tv)
//        
//        //
//        
//    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}






func toHeight(heght:CGFloat)->CGFloat //以6s/6大小为例设计 按比例缩放控件
{
    return (heght / 667 * HEIGHT)
}

func toY(Y:CGFloat)->CGFloat
{
    return (Y / 667 * HEIGHT)
}

func toX(X:CGFloat)->CGFloat
{
    return (X / 375 * WIDTH)
}


func toWidth(width:CGFloat)->CGFloat
{
    return (width / 375 * WIDTH)
    
}