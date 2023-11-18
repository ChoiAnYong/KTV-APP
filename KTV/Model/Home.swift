//
//  Home.swift
//  KTV
//
//  Created by 최안용 on 11/17/23.
//

import Foundation
//: Decodable를 채택해야 json이 제대로 매칭된다.
struct Home: Decodable {
    let videos: [Video]
    let rankings: [Ranking]
    let recents: [Recent]
    let recommends: [VideoListItem]
}

extension Home {
    
    struct Video: Decodable {
        let videoId: Int
        let isHot: Bool
        let title: String
        let subtitle: String
        let imageUrl: URL
        let channel: String
        let channelThumbnailURL: URL
        let channelDescription: String
    }
    
    struct Ranking: Decodable{
        let imageUrl: URL
        let videoId: Int
    }
    
    struct  Recent: Decodable{
        let imageUrl: URL
        let timeStamp: Double
        let title: String
        let channel: String
    }
}
