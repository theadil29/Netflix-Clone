//
//  YouTubeSearchResponse.swift
//  Netflix Clone
//
//  Created by MD Adil on 01/08/22.
//

import Foundation

struct YouTubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IdVideoElement
    
}


struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
    
}
