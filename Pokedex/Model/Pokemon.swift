//
//  Pokemon.swift
//  Pokedex
//
//  Created by Guilherme Golfetto on 25/08/21.
//

import Foundation

struct Pokemon : Codable {
    let id: Int
        let name, welcomeDescription: String
        let image: String
        let genera, pokedexNumber: String
        let baseExperience: Int
        let types: [Abilite]
        let stats: [Stat]
        let height, weight: Int
        let abilites: [Abilite]
        let genderRate: Int
        let eggGroups: [Abilite]

        enum CodingKeys: String, CodingKey {
            case id, name
            case welcomeDescription = "description"
            case image, genera
            case pokedexNumber = "pokedex_number"
            case baseExperience = "base_experience"
            case types, stats, height, weight, abilites
            case genderRate = "gender_rate"
            case eggGroups = "egg_groups"
        }
    
    func getMainColor() -> String {
        let mainType = types[0].name.lowercased()
        
        switch mainType {
            case "normal":
              return "#A8A878"
            case "fighting":
              return "#C03028"
            case "flying":
              return "#A890F0"
            case "poison":
              return "#A040A0"
            case "ground":
              return "#E0C068"
            case "rock":
              return "#B8A038"
            case "bug":
              return "#A8B820"
            case "ghost":
              return "#705898"
            case "steel":
              return "#B8B8D0"
            case "fire":
              return "#FA6C6C"
            case "water":
              return "#6890F0"
            case "grass":
              return "#48CFB2"
            case "electric":
              return "#FFCE4B"
            case "psychic":
              return "#F85888"
            case "ice":
              return "#98D8D8"
            case "dragon":
              return "#7038F8"
            case "dark":
              return "#705848"
            case "fairy":
              return "#EE99AC"
            default:
                return "#A8A878"
        }
    
    }
    
    func getUrlForImage() -> URL? {
        return URL(string: image)
    }
}
// MARK: - Abilite
struct Abilite: Codable {
    let name: String
    let url: String
}

// MARK: - Stat
struct Stat: Codable {
    let baseStat: Int
    let name: Name
    let url: String

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case name, url
    }
}

enum Name: String, Codable {
    case attack = "Attack"
    case defense = "Defense"
    case hp = "HP"
    case spAtk = "Sp. Atk"
    case spDef = "Sp. Def"
    case speed = "Speed"
}
