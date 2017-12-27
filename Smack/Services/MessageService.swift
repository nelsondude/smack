//
//  MessageService.swift
//  Smack
//
//  Created by Alexander Nelson on 12/24/17.
//  Copyright © 2017 Alexander Nelson. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    static let instance = MessageService()
    
    var channels = [Channel]()
    
    func findAllChannel(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                do {
                    self.channels = try JSONDecoder().decode([Channel].self, from: data)
                    completion(true)
                } catch let error {
                    debugPrint(error as Any)
                    completion(false)
                }
//                if let json = JSON(data: data).array {
//                    for item in json {
//                        let name = item["name"].stringValue
//                        let channelDescription = item["description"].stringValue
//                        let id = item["_id"].stringValue
//                        let channel = Channel(channelTitle: name, channelDescription: channelDescription, id: id)
//                        channels.append(channel)
//                    }
//                    completion(true)
//                }
                
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
}
