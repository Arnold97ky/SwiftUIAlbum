//
//  AlbumPage.swift
//  AppleMusic
//
//  Created by Arnold Sylvestre on 8/19/22.
//

import Foundation


struct Album100: Decodable {
    
    let feed: Feed
}

struct Feed: Decodable {

    let results: [Shark]
    let id: String
}

struct Shark: Decodable {
    
    let artistName: String//name artist
    let name: String //album name
    let releaseDate: String//date
    let artworkUrl100: String//image
    let genres: [Genre] //Genre
    let id: String
   
}

struct Genre: Decodable {
    let name: String
    let url: String
    let genreId: String
}
