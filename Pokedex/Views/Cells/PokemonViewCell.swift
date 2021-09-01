//
//  PokemonViewCell.swift
//  Pokedex
//
//  Created by Guilherme Golfetto on 25/08/21.
//

import UIKit
import Foundation
import AlamofireImage

class PokemonViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var vwPokeCard: UIView!
    @IBOutlet weak var lblPokeName: UILabel!
    @IBOutlet weak var lblPokeNumber: UILabel!
    @IBOutlet weak var imgPoke: UIImageView!
    @IBOutlet weak var lblPokeType1: UILabel!
    @IBOutlet weak var lblPokeType2: UILabel!
    
    func setCell(_ pokemon: Pokemon){
        
        vwPokeCard.backgroundColor = UIColor(hexaString: pokemon.getMainColor().lowercased())
        
        vwPokeCard.layer.cornerRadius = 16
        vwPokeCard.clipsToBounds = true
        
        lblPokeName.text = pokemon.name
        
        lblPokeNumber.text = "#" + pokemon.pokedexNumber
        
        lblPokeType1.text = pokemon.types.first!.name
    
        lblPokeType1.layer.cornerRadius = 5
        lblPokeType1.layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor
        lblPokeType1.layer.borderWidth = 80
        lblPokeType1.textAlignment = .center;
        lblPokeType1.clipsToBounds = true
        
        if pokemon.types.indices.contains(1) {
            lblPokeType2.isHidden = false
            lblPokeType2.text = pokemon.types[1].name
            
            lblPokeType2.layer.cornerRadius = 5
            lblPokeType2.layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor
            lblPokeType2.layer.borderWidth = 80
            lblPokeType2.textAlignment = .center;
            lblPokeType2.clipsToBounds = true
            
        } else{
            lblPokeType2.isHidden = true
        }
        
        guard let imageURL = pokemon.getUrlForImage() else { return }
        
        imgPoke.af.setImage(withURL: imageURL)
        
    }
}
