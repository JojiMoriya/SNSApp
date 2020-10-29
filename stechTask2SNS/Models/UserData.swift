//
//  UserData.swift
//  stechTask2SNS
//
//  Created by 守屋譲司 on 2020/10/07.
//

import Foundation
import Firebase

struct UserData {
    
    let userID: String
    let userName: String

    init(data: [String: Any]) {
        userID = data["userID"] as! String
        userName = data["userName"] as! String
    }
}
