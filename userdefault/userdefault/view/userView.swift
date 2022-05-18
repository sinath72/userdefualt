//
//  File.swift
//  userdefault
//
//  Created by Sina Taherkhani on 6/15/1400 AP.
//

import Foundation
import UIKit
protocol UserDataDelegate:class {
    func user(data:user)
    func faild(error:String)
}
class userData{
    weak var delegate:UserDataDelegate!
    let df=UserDefaults.standard
    func userData(username:String!,pasword:String!) {
        if username != nil && (pasword != nil) {
            do {
                let result = try user(username: username, password: pasword)
                let userDict=["username":username,"password":pasword]
                try df.set(userDict, forKey: "newUser")
                self.delegate.user(data: result)
                
            } catch let error {
                self.delegate.faild(error: error.localizedDescription)
            }
        }else{
            self.delegate.faild(error: "field are empty")
        }
    }
    func getUserInfo(){
        do {
            let userInfo = try self.df.value(forKey: "newUser")as! [String:String]
            let userData = user(username: userInfo["username"]!, password: userInfo["password"]!)
            self.delegate.user(data: userData)
        } catch let error {
            print("error is:\(error.localizedDescription)")
        }
    }
    func getUserObjects() -> user {
        do {
        let userInfo = try self.df.value(forKey: "newUser")as! [String:String]
        let userData = user(username: userInfo["username"]!, password: userInfo["password"]!)
        return userData
        }catch let error {
            print("error is:\(error.localizedDescription)")
        }
    }
}
