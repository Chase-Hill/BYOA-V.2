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
        case blitz = "chess_blitz"
        case bullet = "chess_bullet"
        case tactics
    }
    
    let daily: Daily
    let rapid: Rapid
    let blitz: Blitz
    let bullet: Bullet
    let tactics: Tactics
}

struct Daily: Decodable {
    private enum CodingKeys: String, CodingKey {
        case best
        case record
    }
    
    let best: Best
    let record: Record
}

struct Rapid: Decodable {
    private enum CodingKeys: String, CodingKey {
        case best
        case record
    }
    
    let best: Best
    let record: Record
}

struct Blitz: Decodable {
    private enum CodingKeys: String, CodingKey {
        case best
        case record
    }
    
    let best: Best
    let record: Record
}

struct Bullet: Decodable {
    private enum CodingKeys: String, CodingKey {
        case best
        case record
    }
    
    let best: Best
    let record: Record
}

struct Best: Decodable {
    private enum CodingKeys: String, CodingKey {
        case rating
    }
    
    let rating: Int
}

struct Record: Decodable {
    private enum CodingKeys: String, CodingKey {
        case win
        case loss
        case draw
    }
    
    let win: Int
    let loss: Int
    let draw: Int
}

struct Tactics: Decodable {
    private enum CodingKeys: String, CodingKey {
        case highest
    }
    
    let highest: String
}

struct Highest: Decodable {
    private enum CodingKeys: String, CodingKey {
        case rating
    }
    
    let rating: Int
}
