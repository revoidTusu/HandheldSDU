//
//  UserInfo.swift
//  ZDSDU
//
//  Created by Nanfo_Fhzh on 15/11/12.
//  Copyright © 2015年 Nanfo_Fhzh. All rights reserved.
//

import Foundation
import UIKit

class UserInfo:NSObject,NSCoding//实现可序列化
{
    
    var userName:String!
    var userNumber:String!
    var userPassword:String!
    var islogin:Bool!

    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.userName,forKey: "username")
        aCoder.encodeObject(self.userNumber,forKey: "usernum")
        aCoder.encodeObject(self.userPassword,forKey: "userpassword")
        aCoder.encodeObject(self.islogin,forKey: "islogin")

    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        
        self.userName=aDecoder.decodeObjectForKey("username") as! String
        self.userNumber=aDecoder.decodeObjectForKey("usernum") as! String
        self.userPassword=aDecoder.decodeObjectForKey("userpassword") as! String
        self.islogin=aDecoder.decodeObjectForKey("islogin") as! Bool

        
        
    }
    
    override init() {
        
    }
    
    
    
    
    
    
}

