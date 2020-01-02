//
//  ChatMsgSender.swift
//  GavelGo
//
//  Created by mac on 03/01/20.
//  Copyright © 2020 Minder. All rights reserved.
//

import Foundation
import ChattoAdditions
import Chatto

protocol ChatMsgModelProtocol: ChatTextMsgModel, ContentEquatableChatItemProtocol {
    var status: MessageStatus { get set }
}

class ChatMsgSender {
    
}
