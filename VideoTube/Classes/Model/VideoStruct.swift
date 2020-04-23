//
//  VideoStruct.swift
//  VideoTube
//
//  Created by Abdul Azeem on 11/04/20.
//  Copyright © 2020 Mindfire. All rights reserved.
//

import Foundation

struct VideoStruct: Codable {
    let items: [Item]?
}

struct Item: Codable {
    let id: String?
    let snippet: Snippet?
    let contentDetails: ContentDetails?
    let statistics: Statistics?
}

struct Snippet: Codable {
    let title: String?
    let thumbnails: Thumbnails?
    let channelId: String?
    let publishedAt: String?
}

struct Thumbnails: Codable {
    let high: High?
}

struct High: Codable {
    let url: String?
}

struct ContentDetails: Codable {
    let duration: String?
}

struct Statistics: Codable {
    let viewCount: String?
}
