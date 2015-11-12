//
//  AppDelegate.swift
//  ZDSDU
//
//  Created by Nanfo_Fhzh on 15/11/11.
//  Copyright © 2015年 Nanfo_Fhzh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // 获取window句柄
        
        self.window=UIWindow(frame:UIScreen.mainScreen().bounds)
        self.window!.makeKeyAndVisible()
        
        
        
        //---------------获取设备尺寸
        let bounds = UIScreen.mainScreen().bounds
        WIDTH=bounds.width
        HEIGHT=bounds.height
        
        //---------------初始化主视图控制器(tabBarCtrl)
        
        tabBarCtrl  = MyTabBarController()
        
        
        naviCtrl = UINavigationController()
        naviCtrl.addChildViewController(tabBarCtrl)
        naviCtrl.setNavigationBarHidden(true, animated: true)
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent;
        
        
        
        
        //----获取用户信息
        
        
        userinfo = UserInfo()
        userinfo.userName=""
        userinfo.userNumber=""
        userinfo.userPassword=""
        userinfo.islogin = false
        ReadMyUserData()
        
        
        self.window!.rootViewController = naviCtrl
        

        
        
        
        return true
    }
    
    
    func ReadMyUserData()
    {
        let filePath=NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentationDirectory, NSSearchPathDomainMask.AllDomainsMask, true)[0]+"/Userinfo.dat"//得到路径
        var fileGetArr:UserInfo?
        
        fileGetArr=(NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as? UserInfo)
        
        if fileGetArr != nil
        {
            userinfo=fileGetArr!
            
            print(userinfo)
        }
        else{
            userinfo = UserInfo()
            userinfo.userName=""
            userinfo.userNumber=""
            userinfo.userPassword=""
            userinfo.islogin = false
        }
        
        NSLog(filePath as String)//打印提示

        
        
        
    }
    func WriteMyUserData()
    {
        //创建路径
        let fileManager=NSFileManager.defaultManager()
        var sp=NSSearchPathForDirectoriesInDomains(.DocumentationDirectory, NSSearchPathDomainMask.UserDomainMask, true)//得到路径
        do{
            try fileManager.createDirectoryAtPath(sp[0], withIntermediateDirectories: true, attributes: nil)
        }catch
        {
            print(error)
        }
        
        //保存数据
        let filePath=sp[0]+"/Userinfo.dat"//得到路径
        NSKeyedArchiver.archiveRootObject(userinfo,toFile: filePath)
        
        NSLog(filePath as String)//打印提示
        
        //
        //        if sp.count>0
        //        {
        //            print(sp[0])
        //            let url=NSURL(fileURLWithPath: "\(sp[0])/UserData.txt")
        //            let data=NSMutableData()
        //            let tempStr=NSString(format:"%.2f",allMeter/1000)
        //            data.appendData(tempStr.dataUsingEncoding(NSUTF8StringEncoding,allowLossyConversion: true)!)
        //            data.writeToFile(url.path!, atomically: true)
        //            NSLog("保存成功:"+(tempStr as String))
        //        }
        
    }
    

    
    
    
    
    
    
    
    

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

