//
//  DetailViewController.swift
//  FreetoGame
//
//  Created by Tardes on 20/1/26.
//

import UIKit

class DetailViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var ThumabailImagenView: UIImageView!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var platformImagenView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var requisitosLabel: UILabel!
    
    var game: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = game.title
        collectionView.dataSource = self
        
        Task {
            if let loadedGame = await GameProvider.getGameByID(id: game.id) {
                self.game = loadedGame
                DispatchQueue.main.async {
                    self.loadData()
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    // MARK: - Carga de datos
    func loadData() {
        titlelabel.text = game.title
        ThumabailImagenView.loadFrom(url: game.thumbnail)
        genreLabel.text = game.genre
        descriptionLabel.text = game.description ?? "Sin descripción"
        platformImagenView.image = game.getPlatformImage()
        
        // Mostrar requisitos mínimos si existen
        requisitosLabel.text = game.systemRequirements?.description ?? "Sin requisitos"
    }
    
    // MARK: - Métodos de UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return game.screenshots?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Asegúrate de que el identificador coincida exactamente con el storyboard
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ScreenShot Cell", for: indexPath) as! ScreenshotViewCell
        if let screenshot = game.screenshots?[indexPath.row] {
            cell.configure(with: screenshot)
        }

        return cell
    }
    

    
    /*
    // MARK: - Navigation (si necesitas preparar algo antes de un segue)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

