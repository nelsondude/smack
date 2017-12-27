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
    var messages = [Message]()
    var selectedChannel: Channel?
    
    func clearChannels() {
        channels.removeAll()
    }
    
    func findAllChannel(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                do {
                    self.channels = try JSONDecoder().decode([Channel].self, from: data)
                    NotificationCenter.default.post(name: NOTIF_CHANNELS_CHANGED, object: nil)
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
    
    func clearMessages() {
        messages.removeAll()
    }
    
    func findAllMessagesForChannel(channelId: String, completion: @escaping CompletionHandler) {
        Alamofire.request(URL_GET_MESSAGES + channelId, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                self.clearMessages()
                guard let data = response.data else { return }
                if let json = JSON(data).array {
                    for item in json {
                        let messageBody = item["messageBody"].stringValue
                        let channelId = item["channelId"].stringValue
                        let id = item["_id"].stringValue
                        let userName = item["userName"].stringValue
                        let userAvatar = item["userAvatar"].stringValue
                        let userAvatarColor = item["userAvatarColor"].stringValue
                        let timeStamp = item["timeStamp"].stringValue
                        let message = Message(message: messageBody, userName: userName, channelId: channelId, userAvatar: userAvatar, userAvatarColor: userAvatarColor, id: id, timestamp: timeStamp)
                        self.messages.append(message)
                    }
                    completion(true)
                }
            } else {
                debugPrint(response.result.error as Any)
                completion(false)
            }
        }
    }
}
