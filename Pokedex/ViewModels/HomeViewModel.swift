//
//  HomeViewController.swift
//  Pokedex
//
//  Created by Guilherme Golfetto on 25/08/21.
//

import Foundation

struct HomeViewModel {
    //esse cara é realmente necessário ?
    func getPokemons(offset: Int = 0, limit:Int = 60, completion: @escaping (_ pokemons: [Pokemon]) -> Void) {
        
        PokemonApi().getPokemons(offset, limit) { list in
            completion(list)
        }
        
    }

}
