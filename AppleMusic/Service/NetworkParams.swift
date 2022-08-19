//
//  NetworkParams.swift
//  AppleMusic
//
//  Created by Arnold Sylvestre on 8/19/22.
//

import Foundation

enum NetworkParams {
    
    private struct NetworkConstants {
        static let popularBase = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/100/albums.json"
        static let baseImage = "https://is5-ssl.mzstatic.com/image/thumb/Music112/v4/3e/04/eb/3e04ebf6-370f-f59d-ec84-2c2643db92f1/196626945068.jpg/100x100bb.jpg"
        
        static let key = "https://is5-ssl.mzstatic.com/image/thumb/Music112/v4/3e/04/eb/3e04ebf6-370f-f59d-ec84-2c2643db92f1/196626945068.jpg/100x100bb.jpg"
    }
    
    case popularAlbum(Int)
    case AlbumImage(String)
    
    
    var url: URL? {
        switch self {
        case .popularAlbum(let page):
            var components = URLComponents(string: NetworkConstants.popularBase)
            var queryItems: [URLQueryItem] = []
            queryItems.append(URLQueryItem(name: "api_key", value: NetworkConstants.key))
            queryItems.append(URLQueryItem(name: "page", value: "\(page)"))
            components?.queryItems = queryItems
            
            return components?.url
            
            // MARK: Check for '/' in path
        case .AlbumImage(let path):
           // return URL(string: NetworkConstants.baseImage + path)
            let baseURL = URL(string: NetworkConstants.baseImage)
           return URL(string: path, relativeTo: baseURL)
            
        }
    }
    
    
}
