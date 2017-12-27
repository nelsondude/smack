//
//  SocketService.swift
//  Smack
//
//  Created by Alexander Nelson on 12/25/17.
//  Copyright © 2017 Alexander Nelson. All rights reserved.
//

import UIKit
import SocketIO

//let manager = SocketManager(socketURL: URL(string: BASE_URL)!, config: [.log(true), .compress])
//let socket = manager.defaultSocket

class SocketService: NSObject {
    static let instance = SocketService()
    let socketManager = SocketManager(socketURL: URL(string: BASE_URL)!)
    
    override init() {
        super.init()
    }
    
    func establishConnection() {
        socketManager.connect()
        setupHandlers()
    }
    
    func setupHandlers() {
        socketManager.defaultSocket.on("channelCreated") { (dataArray, ack) in
            guard let channelName = dataArray[0] as? String else { return }
            guard let channelDescription = dataArray[1] as? String else { return }
            guard let channelId = dataArray[2] as? String else { return }
            let newChannel = Channel(_id: channelId, name: channelName, description: channelDescription, __v: nil)
            MessageService.instance.channels.append(newChannel)
            
            // Notify the ChannelVC of changed channels
            NotificationCenter.default.post(name: NOTIF_CHANNELS_CHANGED, object: nil)
        }
    }
    
    func closeConnection() {
        socketManager.disconnect()
    }
    
    func addChannel(channelName: String, channelDescription: String, completion: @escaping CompletionHandler) {
        socketManager.defaultSocket.emit("newChannel", channelName, channelDescription)
        completion(true)
    }
}
