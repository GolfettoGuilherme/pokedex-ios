//
//  BaseForm.swift
//  Pokedex
//
//  Created by Guilherme Golfetto on 06/09/21.
//

import Foundation

struct BaseForm: Codable {
    let name: String
    let url: String
    let image: String
    let minLevel: Int?

    enum CodingKeys: String, CodingKey {
        case name, url, image
        case minLevel = "min_level"
    }
}
