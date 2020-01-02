//
//  ChatDataSource.swift
//  GavelGo
//
//  Created by mac on 02/01/20.
//  Copyright © 2020 Minder. All rights reserved.
//

import Foundation
import Chatto

class ChatDataSource: ChatDataSourceProtocol {
    
    var nextMsgId: Int = 0
    let preferredMaxWindowSize = 500
    var slidingWindow: SlidingDataSource<ChatItemProtocol>!
    
    init(count: Int, pageSize: Int) {
        
        self.slidingWindow = SlidingDataSource(count: count, pageSize: pageSize, itemGenerator: { [weak self] () -> ChatItemProtocol in
            
            guard let sSelf = self else { return ChatMsgFactory.makeDummyMsg(msg: "") }
            defer { sSelf.nextMsgId += 1 }
            return ChatMsgFactory.makeDummyMsg(msg: "Entered Msg Here....")
            
        })
        
    }
    
    init(messages: [ChatItemProtocol], pageSize: Int) {
        self.slidingWindow = SlidingDataSource(items: messages, pageSize: pageSize)
    }
    
    var hasMoreNext: Bool {
        return self.slidingWindow.hasMore()
    }
    
    var hasMorePrevious: Bool {
        return self.slidingWindow.hasPrevious()
    }
    
    var chatItems: [ChatItemProtocol] {
        return self.slidingWindow.itemsInWindow
    }
    
    var delegate: ChatDataSourceDelegateProtocol?
    
    func loadNext() {
        self.slidingWindow.loadNext()
        self.slidingWindow.adjustWindow(focusPosition: 1, maxWindowSize: self.preferredMaxWindowSize)
        self.delegate?.chatDataSourceDidUpdate(self, updateType: .pagination)
    }
    
    func loadPrevious() {
        self.slidingWindow.loadPrevious()
        self.slidingWindow.adjustWindow(focusPosition: 0, maxWindowSize: self.preferredMaxWindowSize)
        self.delegate?.chatDataSourceDidUpdate(self, updateType: .pagination)
    }
    
    func adjustNumberOfMessages(preferredMaxCount: Int?, focusPosition: Double, completion: (Bool) -> Void) {
        let didAdjust = self.slidingWindow.adjustWindow(focusPosition: focusPosition, maxWindowSize: preferredMaxCount ?? preferredMaxWindowSize)
        completion(didAdjust)
    }
    
}
