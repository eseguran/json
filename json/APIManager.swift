//
//  APIManager.swift
//  json
//
//  Created by Eddy Segura on 5/26/18.
//  Copyright © 2018 Eddy Segura. All rights reserved.
//

import Foundation
import SwiftyJSON
class APIManager: NSObject{
    
    let baseURL = "https://jsonplaceholder.typicode.com"
    static let sharedInstace = APIManager()
    static let getUsersEndpoint = "/users"
    
    func getPostWithId(postId: Int, onSuccess: @escaping(JSON) -> Void, onFailure: @escaping(Error) -> Void){
        let url : String = baseURL + APIManager.getUsersEndpoint + String(postId)
        let request: NSMutableURLRequest = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "GET"
        let session = URLSession.shared
    let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void
        in
        if(error != nil){
            onFailure(error!)
        } else{
            do {
                let result = try JSON(data: data!)
                onSuccess(result)
            } catch {
                onFailure(error)
            }
        }
    })
        task.resume()
    }
}

