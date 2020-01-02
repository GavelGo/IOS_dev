//
//  ChatViewController.swift
//  GavelGo
//
//  Created by mac on 02/01/20.
//  Copyright © 2020 Minder. All rights reserved.
//

import UIKit
import Chatto
import ChattoAdditions

class ChatBaseViewController: BaseChatViewController {
    
    var shouldUseAlternativePresenter: Bool = false
    var chatInputPresenter: BasicChatInputBarPresenter!
    
    var dataSource: ChatDataSource! {
        didSet{
            self.chatDataSource = self.dataSource
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func createChatInputView() -> UIView {
        
        let chatInputView = ChatInputBar.loadNib()
        var appearance = ChatInputBarAppearance()
        appearance.sendButtonAppearance.title = NSLocalizedString("Send", comment: "")
        appearance.textInputAppearance.placeholderText = NSLocalizedString("Type a message", comment: "")
        self.chatInputPresenter = BasicChatInputBarPresenter(chatInputBar: chatInputView, chatInputItems: self.createChatInputItems(), chatInputBarAppearance: appearance)
        chatInputView.maxCharactersCount = 1000
        return chatInputView
        
    }
    
    func createChatInputItems() -> [ChatInputItemProtocol] {
        var items = [ChatInputItemProtocol]()
        items.append(self.createTextInputItem())
        items.append(self.createPhotoInputItem())
        return items
    }
    
    private func createTextInputItem() -> TextChatInputItem {
        let item = TextChatInputItem()
        item.textInputHandler = { [weak self] text in
          // Your handling logic
        }
        return item
    }

    private func createPhotoInputItem() -> PhotosChatInputItem {
        let item = PhotosChatInputItem(presentingController: self)
        item.photoInputHandler = { [weak self] image, imgSource in
          // Your handling logic
        }
        return item
    }
    
    override func createPresenterBuilders() -> [ChatItemType : [ChatItemPresenterBuilderProtocol]] {
        return [:]
    }
    
}

extension ChatBaseViewController: ChatDataSourceProtocol {
    
    var hasMoreNext: Bool {
        false
    }
    
    var hasMorePrevious: Bool {
        false
    }
    
    var chatItems: [ChatItemProtocol] {
        return []
    }
    
    var delegate: ChatDataSourceDelegateProtocol? {
        get {
            return nil
        }
        set(newValue) {
            
        }
    }
    
    func loadNext() {
        
    }
    
    func loadPrevious() {
        
    }
    
    func adjustNumberOfMessages(preferredMaxCount: Int?, focusPosition: Double, completion: (Bool) -> Void) {
        
    }
    
}
