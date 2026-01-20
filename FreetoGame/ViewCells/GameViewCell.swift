//
//  GameViewCell.swift
//  FreetoGame
//
//  Created by Tardes on 20/1/26.
//

import UIKit

class GameViewCell: UITableViewCell {

    

    @IBOutlet weak var titlelabel: UILabel!
    
    


    @IBOutlet weak var ThumabailImagenView: UIImageView!
    @IBOutlet weak var cardView : UIView!
    
    
    
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
    }

}
