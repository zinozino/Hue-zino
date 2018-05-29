//
//  NetworkManager.swift
//  SimpleBoard
//
//  Created by jeongjinho on 2018. 5. 29..
//  Copyright © 2018년 jeongjinho. All rights reserved.
//

import UIKit
import Alamofire
enum TodoType: String {
    case todo = "/todos"

}

class NetworkManager {

    let baseURL: String = "https://jsonplaceholder.typicode.com/"

    static let sharedInstance: NetworkManager = {

        let instance = NetworkManager()

        //setup code

        return instance

    }()

    func todoByID(_ id: Int, todoType: TodoType, comletionHandler: @escaping (Todo?, Error?) -> Void) {

        let url = "\(self.baseURL)/\(todoType.rawValue)\(id)"

        Alamofire.request(url, method: .get, parameters: [:], encoding: JSONEncoding.default, headers: ["ContentType": "application/json"]).validate(statusCode: 200..<300).responseJSON { (response) in

            if let err = response.error {
                comletionHandler(nil, err)
                return
            }

            guard let data = response.data else {
                let err = BackendError.objectSerialization(reason: "Could geting data")
                comletionHandler(nil, err)
                return
            }
            let decoder = JSONDecoder()
            do {
                let result = try decoder.decode(Todo.self, from: data)
                comletionHandler(result, nil)
                return
            } catch {
                 let err = BackendError.objectSerialization(reason: "not decode data")
                comletionHandler(nil, err)
                return
            }

        }
    }

}
