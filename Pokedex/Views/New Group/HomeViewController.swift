//
//  ViewController.swift
//  Pokedex
//
//  Created by Guilherme Golfetto on 25/08/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var cvPokemons: UICollectionView!
    
    var pokes: [Pokemon] = []
    
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cvPokemons.dataSource = self
        cvPokemons.delegate = self
        getPokemons()
    }
    
    func getPokemons(){
        viewModel.getPokemons { list in
            self.pokes = list
            self.cvPokemons.reloadData()
        }
    }
    
    func getMorePokemons(limit: Int, offset: Int) {
        viewModel.getPokemons(offset: offset, limit: limit) { list in
            self.pokes.append(contentsOf: list)
            self.cvPokemons.reloadData()
        }
    }
    
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if indexPath.row == pokes.count / 2 {
            getMorePokemons(limit: 30, offset: pokes.count)
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width / 2 - 5, height: 100)

    }
}

extension HomeViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokemonCell", for: indexPath) as! PokemonViewCell
        
        if pokes.indices.contains(indexPath.row) {
            cell.setCell(pokes[indexPath.row])
        }
        
        return cell
    }
    
    
}
