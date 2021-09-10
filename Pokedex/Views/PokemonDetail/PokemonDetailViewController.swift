//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by Guilherme Golfetto on 05/09/21.
//

import UIKit
import AlamofireImage

class PokemonDetailViewController: UIViewController {

    var pokemon: Pokemon? //queria uma forma de tratar esse opicional aqui, eu tenho certeza que ele sempre vai estar aqui
    
    @IBOutlet weak var lblPokemonName: UILabel!
    
    @IBOutlet weak var lblPokemonNumber: UILabel!
    
    @IBOutlet weak var lblPokemonType1: UILabel!
    @IBOutlet weak var lblPokemonType2: UILabel!
    
    @IBOutlet weak var lblPokemonGenera: UILabel!
    
    @IBOutlet weak var imgPokemonPic: UIImageView!
    
    @IBOutlet weak var viewInfo: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initComponents()

    }
    
    func initComponents() {
        
        lblPokemonName.text = pokemon!.name
        navigationController?.navigationBar.backgroundColor = UIColor(hexaString: pokemon!.getMainColor().lowercased())
        view.backgroundColor = UIColor(hexaString: pokemon!.getMainColor().lowercased())
        
        lblPokemonNumber.text = pokemon!.pokedexNumber
        
        lblPokemonType1.text = pokemon!.types[0].name
        lblPokemonType1.layer.cornerRadius = 5
        lblPokemonType1.layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor
        lblPokemonType1.layer.borderWidth = 80
        lblPokemonType1.textAlignment = .center;
        lblPokemonType1.clipsToBounds = true
        
        if pokemon!.types.indices.contains(1) {
            lblPokemonType2.text = pokemon!.types[1].name
            lblPokemonType2.layer.cornerRadius = 5
            lblPokemonType2.layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor
            lblPokemonType2.layer.borderWidth = 80
            lblPokemonType2.textAlignment = .center;
            lblPokemonType2.clipsToBounds = true
            lblPokemonType2.isHidden = false
        } else{
            lblPokemonType2.isHidden = true
        }
        
        guard let imageURL = pokemon!.getUrlForImage() else { return }
        
        imgPokemonPic.af.setImage(withURL: imageURL)
        
        

    }

}

