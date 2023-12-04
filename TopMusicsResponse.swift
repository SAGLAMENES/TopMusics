//
//  TopMusicsResponse.swift
//  TopMusics2API
//
//  Created by Enes Saglam on 3.12.2023.
//

import Foundation
//
//  TopMusicsResponse.swift
//  TopMusicsApi
//
//  Created by Enes Saglam on 26.11.2023.
//



public struct TopMusicsResponse: Decodable{
    private enum RootCodingKeys: String, CodingKey{
        case feed
    }
    private enum FeedCodingKeys: String, CodingKey{
        case results
    }
    
    public let results : [Music]
    public init(from decoder: Decoder) throws {
       let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        let feedContainer = try rootContainer.nestedContainer(keyedBy: FeedCodingKeys.self, forKey: .feed)
        self.results = try feedContainer.decode([Music].self, forKey: .results)
    }
}
