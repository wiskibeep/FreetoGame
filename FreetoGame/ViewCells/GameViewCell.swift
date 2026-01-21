//
//  GameViewCell.swift
//  FreetoGame
//
//  Created by Tardes on 20/1/26.
//

import UIKit

class GameViewCell: UITableViewCell {

    

    @IBOutlet weak var titlelabel: UILabel!
    
    

// añadimos el id y la asignacion de ma imagen
    @IBOutlet weak var ThumabailImagenView: UIImageView!
    // Y de la card para reloud 
    @IBOutlet weak var cardView : UIView!
    
    
    
    // añadimos el genero
    @IBOutlet weak var genreLabel: UILabel!
    // AÑADIMOS LA IMAGEN
    @IBOutlet weak var platformImagenView: UIImageView!
    
    // añadimos la descripcion
    @IBOutlet weak var shortDesciptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: titulo
        func configure (with game : Game)
    {
        titlelabel.text = game.title
        
        ThumabailImagenView.loadFrom(url: game.thumbnail)
        
        cardView.layer.cornerRadius = 29

        cardView.layer.masksToBounds = true
        
        
        
        // MAS INFO
        genreLabel.text = game.genre
        
        shortDesciptionLabel.text = game.shortDescription

        
        
        
        
        
        platformImagenView.image = if game.platform == "PC (Windows)" {
            UIImage(systemName: "desktopcomputer")
        } else {
            UIImage(systemName: "safari")
        }
        
    }

}
