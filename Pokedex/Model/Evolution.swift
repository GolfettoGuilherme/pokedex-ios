//
//  EvolutionStructure.swift
//  Pokedex
//
//  Created by Guilherme Golfetto on 06/09/21.
//

import Foundation

struct Evolution : Codable {
    let baseForm, firstEvolution, secondEvolution: BaseForm

        enum CodingKeys: String, CodingKey {
            case baseForm = "base_form"
            case firstEvolution = "first_evolution"
            case secondEvolution = "second_evolution"
    }
}


