//
//  PokeCell.swift
//  pokedex
//
//  Created by Hadi Roohian on 31/08/2016.
//  Copyright © 2016 HadsDevs. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    @IBOutlet weak var pokeImage : UIImageView!
    @IBOutlet weak var nameLbl : UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 10.0
    }
    
    var pokemon : Pokemon!
    
    func configureCell(pokemon : Pokemon) {
        self.pokemon = pokemon
        
        self.pokeImage.image = UIImage(named: "\(self.pokemon.pokedexId)")
        self.nameLbl.text = self.pokemon.name
        
    }
    
    
}
