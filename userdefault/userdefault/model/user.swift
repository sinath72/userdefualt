//
//  user.swift
//  userdefault
//
//  Created by Sina Taherkhani on 6/15/1400 AP.
//

import Foundation
class user {
    private let username:String!
    private let password:String!
    init(username:String!,password:String!) {
        self.username=username
        self.password=password
    }
    func getUsername() -> String {
        return self.username
    }
    func getPassword() -> String {
        return self.password
    }
}
