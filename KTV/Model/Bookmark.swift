//
//  Bookmark.swift
//  KTV
//
//  Created by 최안용 on 11/18/23.
//

import Foundation

struct Bookmark: Decodable {
    
    let channels: [Item]
}

extension Bookmark {
    
    struct Item: Decodable {
        let channel: String
        let channelId: Int
        let thumbnail: URL
    }
}
