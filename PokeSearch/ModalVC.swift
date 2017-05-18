//
//  PopoverVC.swift
//  
//
//  Created by Simon Zhen on 5/16/17.
//
//

import UIKit

protocol ModalVCDelegate {
    func pokemonDidSelect(pokeId: Int)
}

class ModalVC: UIViewController {
    
    var listOfPokemon = [String]()
    var filteredPokemon = [String]()
    var inSearchMode: Bool = false
    
    var delegate: ModalVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listOfPokemon = pokemon
    }    

    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension ModalVC: UICollectionViewDelegate {
    
}

extension ModalVC: UICollectionViewDataSource {
    
    //populate collection
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell {
            
            let poke: String!
            
            if inSearchMode {
                poke = filteredPokemon[indexPath.row]
            }
            else {
                poke = pokemon[indexPath.row]
            }
            
            
                cell.configureCell(indexPath.row)
            
            return cell
        }
        else {
            return UICollectionViewCell()
        }
    }
    
    //when a pokemon is selected
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var poke: String
        
        if inSearchMode {
            poke = filteredPokemon[indexPath.row]
        }
        else {
            poke = listOfPokemon[indexPath.row]
        }
        
        if let delegate = delegate {
            delegate.pokemonDidSelect(pokeId: indexPath.row)
            dismiss(animated: true, completion: nil)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if inSearchMode {
            return filteredPokemon.count
        }
        else {
            return listOfPokemon.count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //set collection cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = view.frame.width / 3 - 20
        return CGSize(width: size, height: size)
    }

}
