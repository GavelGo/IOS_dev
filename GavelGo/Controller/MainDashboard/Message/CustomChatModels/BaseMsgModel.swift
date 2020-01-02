//
//  BaseMsgModel.swift
//  GavelGo
//
//  Created by mac on 02/01/20.
//  Copyright © 2020 Minder. All rights reserved.
//

import Foundation
import Chatto

public enum MessageStatus {
    case failed
    case sending
    case success
}

public protocol MessageModelProtocol: ChatItemProtocol {
    var senderId: String { get }
    var isIncoming: Bool { get }
    var date: Date { get }
    var status: MessageStatus { get }
}

public protocol DecoratedMessageModelProtocol: MessageModelProtocol {
    var messageModel: MessageModelProtocol { get }
}

public extension DecoratedMessageModelProtocol {
    var uid: String {
        return self.messageModel.uid
    }

    var senderId: String {
        return self.messageModel.senderId
    }

    var type: String {
        return self.messageModel.type
    }

    var isIncoming: Bool {
        return self.messageModel.isIncoming
    }

    var date: Date {
        return self.messageModel.date
    }

    var status: MessageStatus {
        return self.messageModel.status
    }
}

open class MessageModel: MessageModelProtocol {
    open var uid: String
    open var senderId: String
    open var type: String
    open var isIncoming: Bool
    open var date: Date
    open var status: MessageStatus

    public init(uid: String, senderId: String, type: String, isIncoming: Bool, date: Date, status: MessageStatus) {
        self.uid = uid
        self.senderId = senderId
        self.type = type
        self.isIncoming = isIncoming
        self.date = date
        self.status = status
    }
}
