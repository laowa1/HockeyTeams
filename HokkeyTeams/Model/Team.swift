//
//  Team.swift
//  HokkeyTeams
//
//  Created by Bend3r on 12.04.2021.
//

import Foundation

struct Team: Decodable {
    let team: TeamDetails
}

struct TeamDetails: Decodable {
    let name: String?
    let conference: String?
    let location: String?
    let image: String?
    let division: String?
}
