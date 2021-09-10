//
//  PokemonDetailViewModel.swift
//  Pokedex
//
//  Created by Guilherme Golfetto on 06/09/21.
//

import Foundation

struct PokemonDetailViewModel {
    
    //esse cara é realmente necessário ???
    func getEvolutions(_ id:Int, completion: @escaping (_ evolutions: Evolution) -> Void) {
        
        PokemonApi().getPokemonEvolutions(id) { response in
            completion(response)
        }
    }

}
