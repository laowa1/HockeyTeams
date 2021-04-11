//
//  Player.swift
//  HokkeyTeams
//
//  Created by Bend3r on 12.04.2021.
//

import Foundation

struct Player: Decodable {
    let shirt_number: Int?
    let name: String?
    let image: String?
    let team: PlayerTeam
}

struct PlayerTeam: Codable {
    let name: String?
}
