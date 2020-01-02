//
//  TextMsgModel.swift
//  GavelGo
//
//  Created by mac on 02/01/20.
//  Copyright © 2020 Minder. All rights reserved.
//

import Foundation
import Chatto

public protocol TextMsgModelProtocol: DecoratedMessageModelProtocol, ContentEquatableChatItemProtocol {
    var text: String { get }
}

class TextMsgModel<MessageModelT: MessageModelProtocol>: TextMsgModelProtocol {
    
    public var messageModel: MessageModelProtocol {
        return self._messageModel
    }
    
    public let _messageModel: MessageModelT
    public let text: String
    
    public init(messageModel: MessageModelT, text: String) {
        self._messageModel = messageModel
        self.text = text
    }
    
    public func hasSameContent(as anotherItem: ChatItemProtocol) -> Bool {
        guard let anotherMessageModel = anotherItem as? TextMsgModel else { return false }
        return self.text == anotherMessageModel.text
    }
    
    static var chatItemType: ChatItemType {
        return "text"
    }
    
}
