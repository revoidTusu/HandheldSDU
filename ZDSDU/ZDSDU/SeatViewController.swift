//
//  SeatViewController.swift
//  ZDSDU
//
//  Created by Nanfo_Fhzh on 15/11/11.
//  Copyright © 2015年 Nanfo_Fhzh. All rights reserved.
//

import UIKit

class SeatViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    //--------UI-----
    var collectionView:UICollectionView!
    var btn_order:UIButton!
    
    
    
    
    var allSeatinfo = ["308","152","152","64","144","152","176","152","180","120","28","28"]
    var floorData = ["三楼","四楼","五楼","六楼","七楼","八楼","九楼","十楼","十一楼","十二楼","图东环楼三楼","图东环楼四楼"]
    var freeSeatToshow = ["","","","","","","","","","","",""]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        initView()
        collectionView.reloadData()
        collectionView.setNeedsDisplay()
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
        collectionView.setNeedsDisplay()
        
        
        refreshSeatInfo()
        
        
        
        
    }
    
    
    func refreshSeatInfo()
    {
        if userinfo.islogin == true{
            
            if(MyService==nil)
            {
                MyService = MyHttpService()
            }
            
            MyService.LoginToLibray(userinfo.userNumber, passwd: userinfo.userPassword, todo: "updateSeat")
        }
        
        
    }
    
    func getSeatUpdate()
    {
        freeSeatToshow.removeAll()//清空
        for str in isfree
        {
            freeSeatToshow.append((str as NSString).substringFromIndex(3))
        }
        collectionView.reloadData()//更新数据
        collectionView.setNeedsDisplay()//更新UI
        
        
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(true)
        
        collectionView.delegate = nil
        collectionView.dataSource = nil

    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let id = "cell"
        var cell : MyCollectionViewCell! = collectionView.dequeueReusableCellWithReuseIdentifier(id, forIndexPath:indexPath) as? MyCollectionViewCell
       
        if(indexPath.section==0)
        {
            //第一行
           cell.tv_floor = floorData[indexPath.row]
           cell.tv_allseat.text = allSeatinfo[indexPath.row]
           cell.tv_remainseat.text = freeSeatToshow[indexPath.row]
            
        }
        if(indexPath.section==1)
        {
            //第2行
            cell.tv_floor = floorData[indexPath.row+3]
            cell.tv_allseat.text = allSeatinfo[indexPath.row+3]
            cell.tv_remainseat.text = freeSeatToshow[indexPath.row+3]

        }
        if(indexPath.section==2)
        {
            //第3行
            cell.tv_floor = floorData[indexPath.row+6]
            cell.tv_allseat.text = allSeatinfo[indexPath.row+6]
            cell.tv_remainseat.text = freeSeatToshow[indexPath.row+6]

        }
        if(indexPath.section==3)
        {
            //第4行
            cell.tv_floor = floorData[indexPath.row+9]
            cell.tv_allseat.text = allSeatinfo[indexPath.row+9]
            cell.tv_remainseat.text = freeSeatToshow[indexPath.row+9]

            
            
        }

        
        cell.tintColor = UIColor.clearColor()
        
        cell.setNeedsDisplay()//更新UI
        
        return cell!
    }
 
    
    
    func initView()
    {
        var tv_tip=UILabel()
        tv_tip.frame = CGRect(x: toX(5), y: toY(75), width: toWidth(168), height: toHeight(35))
        tv_tip.text = "今日剩余座位"
        tv_tip.textColor = UIColor.grayColor()
        tv_tip.textAlignment = .Left
        tv_tip.font = UIFont(name: "Helvetica", size: 15)
        self.view.addSubview(tv_tip)
        
        
        imgView_bg = UIImageView()
        imgView_bg.frame = CGRect(x: 0, y: 0, width: toWidth(375), height: toHeight(73))
        imgView_bg.contentMode = .ScaleAspectFill
        imgView_bg.image = UIImage.init(named: "img_bg")
        self.view.addSubview(imgView_bg)

        tv_title = UILabel()
        tv_title.frame = CGRect(x: toX(114), y: toY(33), width: toWidth(147), height: toHeight(28))
        tv_title.text = "查座预约"
        tv_title.textAlignment = .Center
        tv_title.font = UIFont(name: "Helvetica", size: 20)
        self.view.addSubview(tv_title)
        
        var layout=UICollectionViewFlowLayout()
        layout.scrollDirection = .Vertical
        layout.minimumInteritemSpacing = 1;
        layout.itemSize = CGSize(width: 122,height: 104)
        layout.minimumLineSpacing = 1; //上下的间距 可以设置0看下效果
        
        
        collectionView = UICollectionView.init(frame: CGRect(x: 0, y: toY(110), width: 375, height: 500), collectionViewLayout:layout )
        collectionView.backgroundColor = UIColor.whiteColor()
        collectionView.registerClass(MyCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        self.view.addSubview(collectionView)
        collectionView.reloadData()
        collectionView.setNeedsDisplay()
        
        
        btn_order = UIButton()
        btn_order.frame = CGRect(x: toX(73), y: toY(550), width: toWidth(229), height: toHeight(53))
        btn_order.contentMode = .ScaleAspectFill
        btn_order.setBackgroundImage(UIImage(named: "btn_order"), forState: .Normal)
        btn_order.setTitle("预约明日座位", forState: .Normal )
        btn_order.addTarget(self, action: "btn_orderClicked", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn_order)
        
        

        
    }
    
    func btn_orderClicked()
    {
        if userinfo.islogin == true{
            
            if(MyService==nil)
            {
                MyService = MyHttpService()
            }
            
            MyService.LoginToLibray(userinfo.userNumber, passwd: userinfo.userPassword, todo: "orderTomorrow")
        }
        else
        {
            print("请先登录")
        }
        
    }
    
}
