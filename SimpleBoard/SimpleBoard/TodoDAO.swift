//
//  TodoDAO.swift
//  SimpleBoard
//
//  Created by jeongjinho on 2018. 5. 28..
//  Copyright © 2018년 jeongjinho. All rights reserved.
//

import UIKit


struct Todo: Codable {
    
    var title: String
    var id: Int?
    var userId: Int
    var completed: Int
    
    
    init?(json:[String: Any]) {
        
        guard let title = json["title"] as? String, let id = json["id"] as? Int, let userId = json["userId"] as? Int, let completed = json["completed"] as? Int else { return nil}
        
        self.title = title
        self.userId = userId
        self.id = id
        self.completed = completed

    }
    
    
    static func endPointForID(_ id: Int) -> String {
        return "https://jsonplaceholder.typicode.com/todos/\(id)"
    }
}
