//
//  LoginViewController.swift
//  ZDSDU
//
//  Created by Nanfo_Fhzh on 15/11/12.
//  Copyright © 2015年 Nanfo_Fhzh. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {

    var btnBack:UIButton!
    var btn_Login:UIButton!

    
    var tv_account:UILabel!
    var tv_password:UILabel!
    var tv_logintip:UILabel!
    var tv_tip:UILabel!
    var tf_account:UITextField!
    var tf_password:UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()


        userinfo.userName=""
        userinfo.userNumber=""
        userinfo.userPassword=""
        //重置数据
        initView()
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
        tv_title.text = "登录"
        tv_title.textAlignment = .Center
        tv_title.font = UIFont(name: "Helvetica", size: 20)
        self.view.addSubview(tv_title)

        
        btnBack=UIButton()
        btnBack.frame=CGRect(x: toX(15), y: toY(40), width: toWidth(23), height: toHeight(16))
        btnBack.setBackgroundImage(UIImage(named: "img_back"), forState: .Normal )
        btnBack.contentMode = .ScaleAspectFit
        btnBack.addTarget(self, action: "btn_backClicked", forControlEvents: .TouchUpInside)
        self.view.addSubview(btnBack)
        
        
        btn_Login=UIButton()
        btn_Login.frame=CGRect(x: toX(104), y: toY(399), width: toWidth(168), height: toHeight(43))
        btn_Login.backgroundColor = UIColor.init(red: 80/255, green: 227/255, blue: 194/255, alpha: 100)
        btn_Login.setTitle("登录", forState: .Normal)
        btn_Login.addTarget(self, action: "btn_loginClicked", forControlEvents: .TouchUpInside)
        self.view.addSubview(btn_Login)
        
        tv_account=UILabel()
        tv_account.frame = CGRect(x: toX(17), y: toY(157), width: toWidth(91), height: toHeight(28))
        tv_account.textAlignment = .Center
        tv_account.text = "账号"
        tv_account.font = UIFont(name: "Helvetica", size: 20)
        self.view.addSubview(tv_account)
        
        tv_password=UILabel()
        tv_password.frame = CGRect(x: toX(17), y: toY(214), width: toWidth(91), height: toHeight(28))
        tv_password.textAlignment = .Center
        tv_password.text = "密码"
        tv_password.font = UIFont(name: "Helvetica", size: 20)
        self.view.addSubview(tv_password)
        
        tv_tip=UILabel()
        tv_tip.frame = CGRect(x: toX(0), y: toY(540), width: toWidth(375), height: toHeight(40))
        tv_tip.textAlignment = .Center
        tv_tip.lineBreakMode = .ByWordWrapping
        tv_tip.text = "账号密码为图书馆座位系统账号密码；\n如果未激活，请到图书馆进行激活。"
        tv_tip.font = UIFont(name: "Helvetica", size: 14)
        tv_tip.textColor = UIColor.init(red: 155/255, green: 155/255, blue: 155/255, alpha: 100)
        tv_tip.numberOfLines = 2
        self.view.addSubview(tv_tip)
        
        
        tv_logintip=UILabel()
        tv_logintip.frame = CGRect(x: toX(0), y: toY(323), width: toWidth(375), height: toHeight(20))
        tv_logintip.textAlignment = .Center
        tv_logintip.text = ""
        tv_logintip.font = UIFont(name: "Helvetica", size: 14)
        tv_logintip.textColor = UIColor.redColor()
        self.view.addSubview(tv_logintip)
    
        
        tf_account=UITextField()
        tf_account.frame = CGRect(x: toX(111), y: toY(156), width: toWidth(216), height: toHeight(29))
        tf_account.textAlignment = .Left
        tf_account.keyboardType = .NumberPad
        tf_account.attributedText = NSAttributedString(string: "请输入你的学号")
        tf_account.borderStyle = .RoundedRect
        tf_account.clearButtonMode = .UnlessEditing
        tf_account.textColor = UIColor.init(red: 155/255, green: 155/255, blue: 155/255, alpha: 100)
        tf_account.delegate = self
        tf_account.returnKeyType = .Next
        self.view.addSubview(tf_account)

        
        tf_password=UITextField()
        tf_password.frame = CGRect(x: toX(111), y: toY(214), width: toWidth(216), height: toHeight(29))
        tf_password.textAlignment = .Left
        tf_password.borderStyle = .RoundedRect
        tf_password.textColor = UIColor.init(red: 155/255, green: 155/255, blue: 155/255, alpha: 100)
        tf_password.clearButtonMode = .UnlessEditing
        tf_password.delegate = self
        tf_password.font = UIFont(name: "Helvetica", size: 12)
        tf_password.returnKeyType = .Done
        tf_password.secureTextEntry = true
        self.view.addSubview(tf_password)

        
        
        
        
        
        
        
        
    }
    
    func btn_loginClicked()
    {
        if(MyService == nil )
        {
            MyService = MyHttpService()
        }
        if( tf_password.text != "" && tf_account.text != "" && tf_account.text != "请输入你的学号")
        {
             MyService.LoginToLibray(tf_account.text!, passwd: tf_password.text!)
        }
        else
        {
            tv_logintip.textColor = UIColor.redColor()
            tv_logintip.text = "请输入学号或密码"

        }
        
    }
    
    func GetLoginResult(code:Int)
    {
        switch code
        {
        case 0:
            tv_logintip.textColor = UIColor.greenColor()
            
            tv_logintip.text = ""
            userinfo.userNumber=tf_account.text//保存账户密码
            userinfo.userPassword=tf_password.text
            userinfo.islogin=true
            //写数据
            print(userinfo.userNumber)
            ((UIApplication.sharedApplication().delegate) as! AppDelegate).WriteMyUserData()
            
            
            
            let alert =  UIAlertController.init(title: "提示", message: "登录成功\n欢迎你 \(userinfo.userNumber)", preferredStyle: .Alert)
            let enterBtn = UIAlertAction.init(title: "确定", style: .Default, handler: { (UIAlertAction) -> Void in
                
                self.dismissViewControllerAnimated(true, completion: nil)
                self.btn_backClicked()//登陆成功后返回

            })
            
            alert.addAction(enterBtn)
            self.presentViewController(alert, animated: true, completion: nil)

            break
        case 1:
            tv_logintip.textColor = UIColor.redColor()
            tv_logintip.text = "登录失败，用户名或密码错误"

            break
            
        default:
            break
            
        }

    }
    

    
    
    
    func btn_backClicked()
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        tf_account.delegate = self
        tf_password.delegate = self

        print("book")
        
    }
    
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        tf_account.delegate = nil
        tf_password.delegate = nil
        
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        textField.textColor = UIColor.blackColor()

        return true
        
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if(textField.text=="请输入你的密码" || textField.text=="请输入你的学号")
        {
            textField.text = ""
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {

        textField.resignFirstResponder()
        return true
    }
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //检测View被点击收起键盘
        self.view.endEditing(true)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
