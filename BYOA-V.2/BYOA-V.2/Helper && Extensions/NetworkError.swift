//
//  NetworkError.swift
//  BYOA-V.2
//
//  Created by Chase on 3/1/23.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidURL
    case thrownError(Error)
    case noData
    case unableToDecode
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL. Check URL Endpoint."
        case .thrownError(let error):
            return "Thrown Error: \(error.localizedDescription)"
        case .noData:
            return "No Data Was Recieved From Network Fetch. Check Again."
        case .unableToDecode:
            return "Unable To Decode The Data From Network. Check Again."
        }
    }
}
