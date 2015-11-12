//
//  MyHttpService.swift
//  ZDSDU
//
//  Created by Nanfo_Fhzh on 15/11/12.
//  Copyright © 2015年 Nanfo_Fhzh. All rights reserved.
//

import Foundation
import Alamofire



class MyHttpService:NSObject,NSXMLParserDelegate
{
    
    let PARSER_SEAT=1//解析座位
    let PARSER_NAME=2//解析姓名
    let PARSER_BOOKSEATLIST=3//解析order的key
    var parserMode:Int=0//默认不解析
    var __VIEWSTATE:String!
    var __EVENTVALIDATION:String!

    var userid:String!
    var usepass:String!

    override init() {
        super.init()
    }
  
    func LoginToLibray(id:String,passwd:String,todo:String="")-> Int
    {
        var loginResult = 1// 0登陆成功  1登陆失败
        self.userid = id
        self.usepass = passwd
        
        let loginbody = ["__VIEWSTATE" : "/wEPDwUKMTQzNzIwMTA1OA9kFgICAQ9kFgICBw8QZA8WEWYCAQICAgMCBAIFAgYCBwIIAgkCCgILAgwCDQIOAg8CEBYREAURLeivt+mAieaLqeWtpuagoS0FAi0xZxAFFOWxseS4nOWkp+WtpijlqIHmtbcpBQIxNWcQBRLnlLXlrZDnp5HmioDlpKflraYFAjE2ZxAFDOWOpumXqOWkp+WtpgUCMTdnEAUS5Lit5Zu95Lq65rCR5aSn5a2mBQIyMGcQBRLljJfkuqzlt6XllYblpKflraYFAjQ0ZxAFEuWMl+S6rOS6pOmAmuWkp+WtpgUCNjBnEAUS5q2m5rGJ55CG5bel5aSn5a2mBQI2M2cQBRLkuK3lm73mlL/ms5XlpKflraYFAjY5ZxAFDOW+ruS/oea1i+ivlQUCODBnEAUM5rWL6K+V5a2m5qChBQI4MmcQBRLnrKzkuozlhpvljLvlpKflraYFAjg0ZxAFD+a1i+ivleWtpuagoeS4gAUCODhnEAUP5rWL6K+V5a2m5qCh5LqMBQI4OWcQBQ/mtYvor5XlrabmoKHkuIkFAjkwZxAFEuWkp+i/nuWMu+enkeWkp+WtpgUCOTFnEAUS5b6u5L+h5rWL6K+V5a2m5qChBQMxMDBnZGQYAQUeX19Db250cm9sc1JlcXVpcmVQb3N0QmFja0tleV9fFgEFEGNoa19SZW1QYXNzcHdvcmRd3OybobyyDW2n9wlCSuCfyWc+oj1iHgMXdWXszOYoQA==",
            "__EVENTVALIDATION":"/wEWBQLFwaKCCgK1lMLgCgLS9cL8AgKA8vrfDwKXzJ6eD2NB0I4o9eMEvHDicGSIqYqM27KKYo5ZWXxmrnD3yMng",
            "subCmd":"Login",
            "txt_LoginID":"\(id)",
            "txt_Password": "\(passwd)",
            "selSchool":"15",
            "chk_RemPasspword":"on"]

        let loginhead = [
            "Host":"yuyue.juneberry.cn",
            "Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
            ,"Connection":"keep-alive"
            ,"User-Agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36",
            "Content-Type":"application/x-www-form-urlencoded"]
        
        Alamofire.request(.POST, "http://yuyue.juneberry.cn/Login.aspx", parameters: loginbody,encoding:.URL ,
            headers: loginhead ).responseData { (response:Response<NSData, NSError>) -> Void in
                    let str = String(data: response.data!, encoding: NSUTF8StringEncoding)
                
                
                    print(id)
                    print(passwd)
                    if ( (str!.containsString("你好,")) != false)
                    {
                        NSLog("登陆成功")
                        loginResult = 0
                        self.parserMode = self.PARSER_NAME
                        self.xmlJX(response.data!)
                        
                        if(todo=="updateSeat")
                        {
                            //查询座位
                            self.seat()

                        }
                        
                        if(todo=="orderTomorrow")
                        {
                            //查询座位
                            self.order()
                            
                        }
                        
                    }
                        
                    if(str!.containsString("用户名或密码错误") == true)
                    {
                        NSLog("用户名或密码错误")
                        loginResult = 1

                    }
                    //回调 保证同步
                   if(todo=="")
                   {
                        loginViewCtrl.GetLoginResult(loginResult)
                   }
   
    
        }
        
        return loginResult

        
        
    }
    
    
    func order()
    {
        
        
        orederStep1()
//        let loginbody = ["__VIEWSTATE" : "/wEPDwUKMTQzNzIwMTA1OA9kFgICAQ9kFgICBw8QZA8WEWYCAQICAgMCBAIFAgYCBwIIAgkCCgILAgwCDQIOAg8CEBYREAURLeivt+mAieaLqeWtpuagoS0FAi0xZxAFFOWxseS4nOWkp+WtpijlqIHmtbcpBQIxNWcQBRLnlLXlrZDnp5HmioDlpKflraYFAjE2ZxAFDOWOpumXqOWkp+WtpgUCMTdnEAUS5Lit5Zu95Lq65rCR5aSn5a2mBQIyMGcQBRLljJfkuqzlt6XllYblpKflraYFAjQ0ZxAFEuWMl+S6rOS6pOmAmuWkp+WtpgUCNjBnEAUS5q2m5rGJ55CG5bel5aSn5a2mBQI2M2cQBRLkuK3lm73mlL/ms5XlpKflraYFAjY5ZxAFDOW+ruS/oea1i+ivlQUCODBnEAUM5rWL6K+V5a2m5qChBQI4MmcQBRLnrKzkuozlhpvljLvlpKflraYFAjg0ZxAFD+a1i+ivleWtpuagoeS4gAUCODhnEAUP5rWL6K+V5a2m5qCh5LqMBQI4OWcQBQ/mtYvor5XlrabmoKHkuIkFAjkwZxAFEuWkp+i/nuWMu+enkeWkp+WtpgUCOTFnEAUS5b6u5L+h5rWL6K+V5a2m5qChBQMxMDBnZGQYAQUeX19Db250cm9sc1JlcXVpcmVQb3N0QmFja0tleV9fFgEFEGNoa19SZW1QYXNzcHdvcmRd3OybobyyDW2n9wlCSuCfyWc+oj1iHgMXdWXszOYoQA==",
//            "__EVENTVALIDATION":"/wEWBQLFwaKCCgK1lMLgCgLS9cL8AgKA8vrfDwKXzJ6eD2NB0I4o9eMEvHDicGSIqYqM27KKYo5ZWXxmrnD3yMng",
//            "subCmd":"query"]
//        
//        let loginhead = [
//            "Host":"yuyue.juneberry.cn",
//            "Origin":"http://yuyue.juneberry.cn",
//            "Referer":"http://yuyue.juneberry.cn/BookSeat/BookSeatMessage.aspx?seatNo=000103002&seatShortNo=002&roomNo=000103&date=2015/11/13",
//            "Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
//            ,"Connection":"keep-alive"
//            ,"User-Agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36",
//            "Content-Type":"application/x-www-form-urlencoded",
//            "Cookie":"ASP.NET_SessionId=\(self.getCookieToSend())"]
//        
//        let url="http://yuyue.juneberry.cn/BookSeat/BookSeatMessage.aspx?seatNo=000103002&seatShortNo=002&roomNo=000103&date=2015%2f11%2f13"
//
//        
//        
//        Alamofire.request(.POST, url, parameters: loginbody,encoding:.URL ,
//            headers: loginhead ).responseData { (response:Response<NSData, NSError>) -> Void in
//                let str = String(data: response.data!, encoding: NSUTF8StringEncoding)
//                
//                print(response.request)
//                print(response.response)
//                print(response.result)
//                print(str)
//                
//                
//        }

        
        
    }
    
    func orederStep1()//进入选楼层
    {
        print("STEP11111")

        
        Alamofire.request(
            .GET,
            "http://yuyue.juneberry.cn/BookSeat/BookSeatListForm.aspx",
            parameters: nil,
            encoding: ParameterEncoding.URL,
            headers: [
                "Host":"yuyue.juneberry.cn",
                "Referer":"http://yuyue.juneberry.cn/MainFunctionPage.aspx",
                "Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
                ,"Connection":"keep-alive"
                ,"User-Agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36",
                "Content-Type":"application/x-www-form-urlencoded"
                ,"Cookie":"ASP.NET_SessionId=\(self.getCookieToSend())"
            ]
            ).responseData({ (response:Response<NSData, NSError>) -> Void in
                
                
                print(response.request)
                print(response.response)
                print(response.result)
                print(String(data: response.data!, encoding: NSUTF8StringEncoding))
                self.parserMode = self.PARSER_BOOKSEATLIST
                
                self.xmlJX(response.data!)
                
                //解析
            })

        
        
    }
    
    
    
    
    
    func seat()
    {
        Alamofire.request(
            .GET,
            "http://yuyue.juneberry.cn/ReadingRoomInfos/ReadingRoomState.aspx",
            parameters: nil,
            encoding: ParameterEncoding.URL,
            headers: [
                "Host":"yuyue.juneberry.cn",
                "Referer":"http://yuyue.juneberry.cn/MainFunctionPage.aspx",
                "Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
                ,"Connection":"keep-alive"
                ,"User-Agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36",
                "Content-Type":"application/x-www-form-urlencoded"
                ,"Cookie":"ASP.NET_SessionId=\(self.getCookieToSend())"
            ]
            ).responseData({ (response:Response<NSData, NSError>) -> Void in
                
//                print(String(data: response.data!, encoding: NSUTF8StringEncoding))
//                print(response.request)
//                print(response.response)
//                print(response.result)
                
                self.parserMode = self.PARSER_SEAT
                isfree = []

                
                self.xmlJX(response.data!)
                
                //解析
            })

    }
    
    //解析XML
    func xmlJX(data:NSData)
    {
        
        var parser = NSXMLParser.init(data: data)
        if( parserMode == PARSER_BOOKSEATLIST)
        {
            
            //var theXML = NSString.init(bytes: , length: <#T##Int#>, encoding: <#T##UInt#>)
            NSXMLParser.init(contentsOfURL: NSURL(string: "http://yuyue.juneberry.cn/BookSeat/BookSeatListForm.aspx")!)
        }
        parser.delegate = self//设置代理
        parser.parse()//开始解析
        
    }


    func parser(parser: NSXMLParser, parseErrorOccurred parseError: NSError) {
        print(parseError)
    }
    
    
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        switch parserMode
        {
        case PARSER_SEAT:
            
            break
            
        case PARSER_NAME:
            



            break
            
            
        case PARSER_BOOKSEATLIST:
            //开始解析某个节点
            
         //   print(elementName)
            if elementName == "div"
            {
                var  a = attributeDict["name"]! as String//返回每个楼层总座位数据
                if a == "__VIEWSTATE"
                {
                    __VIEWSTATE = attributeDict["value"]
        
                    print(__VIEWSTATE)
                }
                
                if a == "__EVENTVALIDATION"
                {
                    __EVENTVALIDATION = attributeDict["value"]
                    print(__EVENTVALIDATION)
                }
                
            }
      
            
            break
        default:
            break
        }

    }
    

    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        
        switch parserMode
        {
        case PARSER_SEAT:
            if (string.containsString("楼:剩余")) == true
            {
                seatInfo.append(string)
            }
            
            if (string.containsString("在座：")) == true
            {
                onSeat.append(string)
            }
            
            if (string.containsString("暂离：")) == true
            {
                abreak.append(string)
            }
            
            if (string.containsString("空闲：")) == true
            {
                isfree.append(string)
            }

            break
            
        case PARSER_NAME:
            if (string.containsString("你好,")) == true
            {
                //三种情况 姓名 2 3 4字
                var str:NSString = NSString(string: string)
                let s=str
                let s1=str
                let s2=str

                //第一种情况 三个字
                let a = s.substringWithRange(NSMakeRange(4,1))
                if( a == "好")
                {
                    print("三个字")
                    print(str)
                    print(str.substringToIndex(3))
                    userinfo.userName = str.substringToIndex(3)
                }
                
                //第二种情况 两个字
                let b = s1.substringWithRange(NSMakeRange(3,1))
                if( b == "好")
                {
                    print("两个字")
                    userinfo.userName = str.substringToIndex(2)
                    
                }
                
                //第三种情况 四个字
                let c = s2.substringWithRange(NSMakeRange(5,1))
                if( c == "好")
                {
                    print("四个字")

                    userinfo.userName = str.substringToIndex(4)
                }
                
                if(userinfo.userName == "")
                {
                    print("获取异常")
                }
                
            }
            
            break
            
        case PARSER_BOOKSEATLIST:
            
            //print(string)
            break
            
        default:
            break

        
        
        }
        
        
    }
    
    
    func parserDidEndDocument(parser: NSXMLParser) {
        print(seatInfo)
        print(onSeat)
        print(abreak)
        print(isfree)
        if(parserMode == PARSER_SEAT){
            print("--------------------------回调函数")
            seatViewCtrl.getSeatUpdate()//回调

        }

    }
    

    
    
    
    func GetCookieArray()->[NSHTTPCookie]{
        
        let cookieStorage = NSHTTPCookieStorage.sharedHTTPCookieStorage()
        let cookieArray = cookieStorage.cookies
        if let arr = cookieArray{
            
            return cookieArray! as [NSHTTPCookie]
        }
        else{
            return []
        }
    }
    
    func getCookieToSend()->String
    {
        var cookieToSend = ""
        let cookieArray = GetCookieArray()
        if cookieArray.count > 0
        {
            for ck:NSHTTPCookie in cookieArray
            {
                if ck.name == "ASP.NET_SessionId"
                {
                    cookieToSend=ck.value
                    break
                }
                
            }
        }
        print("The ASP.NET_SessionId:\(cookieToSend)")
        
        return cookieToSend
    }
    

    
    
    
    
    
    
    
    
    
    
    
}