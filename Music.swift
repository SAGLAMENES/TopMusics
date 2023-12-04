//
//  Music.swift
//  TopMusicsApi
//
//  Created by Enes Saglam on 26.11.2023.
//

import Foundation


public struct Music: Decodable{
    public    let artistName, id, name, releaseDate: String
    public    let kind: Kind
    public    let artistID: String?
    public    let artistURL: String?
    public    let contentAdvisoryRating: ContentAdvisoryRating?
    public   let artworkUrl100: String
    public  let genres: [Genre]
    public  let url: String

        enum CodingKeys: String, CodingKey {
            case artistName, id, name, releaseDate, kind
            case artistID = "artistId"
            case artistURL = "artistUrl"
            case contentAdvisoryRating, artworkUrl100, genres, url
        }
}

public enum ContentAdvisoryRating: String, Codable {
        case explict = "Explict"
}

    // MARK: - Genre
public struct Genre: Codable {
        let genreID, name: String
        let url: String

        enum CodingKeys: String, CodingKey {
            case genreID = "genreId"
            case name, url
    }
}

public enum Kind: String, Codable {
        case albums = "albums"
}

