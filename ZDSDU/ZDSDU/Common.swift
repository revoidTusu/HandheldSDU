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

var tabBarCtrl:MyTabBarController!//主视图控制器


var seatBarItem:UITabBarItem!//tabbar的各item
var bookBarItem:UITabBarItem!
var aboutBarItem:UITabBarItem!

var imgView_bg:UIImageView!
var tv_title:UILabel!

var WIDTH:CGFloat!
var HEIGHT:CGFloat!


class MySeatTableViewCell:UITableViewCell {
    var tv:UILabel!
    var tv_seat:UILabel!
    
    
    var img_bg:UIImageView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.init(red: 35/255, green: 194/255, blue: 217/255, alpha: 100)
        
        tv=UILabel()
        tv.frame=CGRect(x: toX(10), y: toY(8.5), width: toWidth(150), height: toHeight(20))
        tv.textAlignment = .Left
        tv.font=UIFont(name: "Helvetica", size: 20)
        self.contentView.addSubview(tv)
        
        tv_seat=UILabel()
        tv_seat.frame=CGRect(x: toX(150), y: toY(8.5), width: toWidth(200), height: toHeight(20))
        tv_seat.text = "剩余122/总座位:308"
        tv_seat.textAlignment = .Right
        tv_seat.font=UIFont(name: "Helvetica", size: 20)
        self.contentView.addSubview(tv_seat)
        
        
    }
    
    
    
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