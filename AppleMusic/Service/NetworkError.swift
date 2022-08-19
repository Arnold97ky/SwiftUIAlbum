//
//  NetworkError.swift
//  AppleMusic
//
//  Created by Arnold Sylvestre on 8/19/22.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case invalidStatusCode(Int)
    case generalError(Error)
}
