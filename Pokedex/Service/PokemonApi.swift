//
//  PokemonApi.swift
//  Pokedex
//
//  Created by Guilherme Golfetto on 25/08/21.
//

import Foundation
import Alamofire

struct PokemonApi {
    
    private let baseUrl = "http://192.168.0.8:3333"
    
    func getPokemons(_ offset:Int,_ limit:Int, completion: @escaping (_ response: [Pokemon]) -> Void) {
        
        let url = baseUrl + "/pokemons"
        
        let limitParam = "?limit=\(limit)"
        
        let offsetParam = "&offset=\(offset)"
        
        AF.request(url + limitParam + offsetParam, method: .get).responseJSON { response in
            
            guard let responseData = response.data else{
                completion([])
                return
            }
            
            guard let dados = try? JSONDecoder().decode([Pokemon].self, from: responseData) else {return}
            
            completion(dados)
        }
    }
}
