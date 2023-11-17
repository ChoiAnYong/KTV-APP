//
//  VideoListItem.swift
//  KTV
//
//  Created by 최안용 on 11/17/23.
//

import Foundation

struct VideoListItem: Decodable {
    let imageUrl: URL
    let title: String
    let playtime: Double
    let channel: String
    let videoId: Int
}
