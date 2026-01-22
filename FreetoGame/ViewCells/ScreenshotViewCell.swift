//
//  ScreenshotViewCell.swift
//  FreetoGame
//
//  Created by Tardes on 22/1/26.
//

import UIKit

class ScreenshotViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var screenshotImageView: UIImageView!
    
    func configure(with screenshot : screenShot){
        screenshotImageView.loadFrom(url: screenshot.image)
    }
    
}
