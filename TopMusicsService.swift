//
//  TopMusicsService.swift
//  TopMusicsApi
//
//  Created by Enes Saglam on 26.11.2023.
//

import Foundation
import Alamofire

public protocol TopMusicsServiceProtocol {
    func fetchTopMusics(completion: @escaping (Result<TopMusicsResponse>) -> Void)
}

public class TopMusicsService: TopMusicsServiceProtocol {
    
    public enum Error: Swift.Error {
        case serializationError(internal: Swift.Error)
        case networkError(internal: Swift.Error)
    }
    
    public init() { }
    
    public func fetchTopMusics(completion: @escaping (Result<TopMusicsResponse>) -> Void) {
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/50/albums.json"
        
        AF.request(urlString).responseData { (response) in
            switch response.result {
            case .success(let data):
                
                do {
                    let response = try JSONDecoder().decode(TopMusicsResponse.self, from: data)
                    completion(.success(response))
                } catch {
                    completion(.failure(Error.serializationError(internal: error)))
                }
            case .failure(let error):
                completion(.failure(Error.networkError(internal: error)))
            }
        }
    }
}

