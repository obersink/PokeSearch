//
//  PokeCell.swift
//  PokeSearch
//
//  Created by Simon Zhen on 5/17/17.
//  Copyright © 2017 Simon Zhen. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
    }
    
    func configureCell(_ pokeId: Int) {
        thumbImage.image = UIImage(named: "\(pokeId + 1)")
        nameLabel.text = pokemon[pokeId]
    }
    
}

