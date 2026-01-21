//
//  ViewController.swift
//  FreetoGame
//
//  Created by Tardes on 20/1/26.
//

import UIKit


//MARK: fucnion inicial de la lista
class ListViewController: UIViewController, UITableViewDataSource {
    
    // Enlace a la tabla de la interfaz (debe estar conectado en el storyboard)
    @IBOutlet weak var tableView: UITableView!
    
  //  @IBOutlet weak var searchBar: UISearchBar! seañade en la visa de main uno nuevo para asignar
    
    // Almacena la lista de juegos que se mostrarán en la tabla
    var gamelist: [Game] = []
    
    // Método que se llama una vez que la vista ha sido cargada en memoria
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configura el dataSource de la tabla para que sea este controlador
        tableView.dataSource = self
        
        // Llama a la función que obtiene la lista de juegos de manera asíncrona
        Task {
            
            print ("hola 1")
            
            // Obtiene la lista de juegos desde el proveedor (API)
            gamelist = await GameProvider.getGameList()
            
            print("Hola 2")
            
            // Recarga la tabla en el hilo principal una vez obtenidos los datos
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            print("hola 3333")
        }
        print ("Hola44")
    }
    
    
    
    
    // MARK: - Métodos de UITableViewDataSource
    
    /// Devuelve el número de filas a mostrar en la sección de la tabla.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gamelist.count
    }
    
    /// Configura y proporciona la celda para una fila específica de la tabla.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Obtiene una celda reutilizable del tipo correcto
        let cell = tableView.dequeueReusableCell(withIdentifier: "Game Cell", for: indexPath) as! GameViewCell
        // Obtiene el juego correspondiente a la fila
        let game = gamelist[indexPath.row]
        // Configura la celda con la información del juego
        cell.configure(with: game)
        return cell
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as! DetailViewController
        let indexPath = tableView.indexPathForSelectedRow!
        let game = gamelist[indexPath.row]
        detailViewController.game = game
         
        // deselccionar label 
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


/*
 //
 //  ViewController.swift
 //  FreetoGame
 //
 //  Created by Tardes on 20/1/26.
 //

 import UIKit

 class ListViewController: UIViewController, UITableViewDataSource {
     
     @IBOutlet weak var tableView: UITableView!
     
     var gamelist: [Game] = []
     
     override func viewDidLoad() {
         super.viewDidLoad()
         // Do any additional setup after loading the view.
         
         tableView.dataSource = self
         
         Task {
             gamelist = await GameProvider.getGameList()
             
             DispatchQueue.main.async {
                 self.tableView.reloadData()
             }
         }
     }
     
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return gamelist.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "Game Cell", for: indexPath) as! GameViewCell
         let game = gamelist[indexPath.row]
         cell.configure(with: game)
         return cell
     }
 }

 
*/
