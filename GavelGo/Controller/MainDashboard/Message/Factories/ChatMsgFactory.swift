//
//  ChatMsgFactory.swift
//  GavelGo
//
//  Created by mac on 03/01/20.
//  Copyright © 2020 Minder. All rights reserved.
//

import Foundation
import ChattoAdditions
import Chatto

class ChatMsgFactory {
    
    class func makeDummyMsg(msg: String) -> MessageModelProtocol {
        //let senderId = isIncoming ? "1" : "2"
        let messageModel = MessageModel(uid: "UID_ABC", senderId: "1", type: TextMsgModel<MessageModel>.chatItemType, isIncoming: true, date: Date(), status: .success)
        return TextMsgModel(messageModel: messageModel, text: "XYZ")
    }
    
}

extension PhotoMessageModel {
    static var chatItemType: ChatItemType {
        return "photo"
    }
}

extension ChatItemType {
    static var compoundItemType = "compound"
}
