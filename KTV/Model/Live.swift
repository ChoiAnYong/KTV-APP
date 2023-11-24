//
//  Live.swift
//  KTV
//
//  Created by 최안용 on 11/24/23.
//

import Foundation

// MARK: - Live
struct Live: Decodable {
    let list: [Item]
}

extension Live {
    struct Item: Decodable {
        let videoId: Int
        let thumbnailUrl: URL
        let title: String
        let channel: String
    }
}
