//
//  ChattingViewModel.swift
//  KTV
//
//  Created by 최안용 on 11/24/23.
//

import Foundation

@MainActor class ChattingViewModel {
    
    private let chatSimulator = ChatSimulator()
    var chatReceived: (() -> Void)?
    private(set) var message: [ChatMessage] = []
    
    init() {
        self.chatSimulator.setMessageHandler { [weak self] in
            self?.message.append($0)
            self?.chatReceived?()
        }
    }
    
    func start() {
        self.chatSimulator.start()
    }
    
    func stop() {
        self.chatSimulator.stop()
    }
    
    func sendMessage(_ message: String) {
        self.chatSimulator.sendMessage(message)
    }
}
