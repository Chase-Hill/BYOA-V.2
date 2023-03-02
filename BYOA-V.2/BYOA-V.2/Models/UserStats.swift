//
//  UserStats.swift
//  BYOA-V.2
//
//  Created by Chase on 3/1/23.
//

import Foundation

struct UserStats: Decodable {
    private enum CodingKeys: String, CodingKey {
        case daily = "chess_daily"
        case rapid = "chess_rapid"
        case bullet = "chess_bullet"
        case blitz = "chess_blitz"
        case tactics
    }
    
    let daily: String
    let rapid: String
    let bullet: String
    let blitz: String
    let tactics: String
}

struct Daily {
    private enum CodingKeys: String, CodingKey {
        case best
        case record
    }
    
    let best: String
    let record: String
}

struct Rapid {
    private enum CodingKeys: String, CodingKey {
        case best
        case record
    }
    
    let best: String
    let record: String
}

struct Bullet {
    private enum CodingKeys: String, CodingKey {
        case best
        case record
    }
    
    let best: String
    let record: String
}

struct Blitz {
    private enum CodingKeys: String, CodingKey {
        case best
        case record
    }
    
    let best: String
    let record: String
}

struct Best {
    private enum CodingKeys: String, CodingKey {
        case rating
    }
    
    let rating: Int
}

struct Record {
    private enum CodingKeys: String, CodingKey {
        case win
        case loss
        case draw
    }
    
    let win: Int
    let loss: Int
    let draw: Int
}

struct Tactics {
    private enum CodingKeys: String, CodingKey {
        case highest
    }
    
    let highest: String
}
struct Highest {
    private enum CodingKeys: String, CodingKey {
        case rating
    }
    
    let rating: Int
}
