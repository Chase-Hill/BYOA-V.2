//
//  UserDetails.swift
//  BYOA-V.2
//
//  Created by Chase on 3/1/23.
//

import Foundation

struct UserDetails: Decodable {
    private enum CodingKeys: String, CodingKey {
        case avatar
        case name
        case username
        case followers
        case location
        case league
        case isVerified = "verified"
    }
    
    let avatar: String?
    let name: String?
    let username: String
    let followers: Int
    let location: String?
    let league: String
    let isVerified: Bool
}
