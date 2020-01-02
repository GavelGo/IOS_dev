//
//  ChatTextMsgModel.swift
//  GavelGo
//
//  Created by mac on 02/01/20.
//  Copyright © 2020 Minder. All rights reserved.
//

import Foundation
import ChattoAdditions

class ChatTextMsgModel: TextMsgModel<MessageModel>, ChatMsgModelProtocol {
    
    public override init(messageModel: MessageModel, text: String) {
        super.init(messageModel: messageModel, text: text)
    }

    public var status: MessageStatus {
        get {
            return self._messageModel.status
        }
        set {
            self._messageModel.status = newValue
        }
    }
    
}
