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

    
    
    
    // Almacena la lista de juegos que se mostrarán en la tabla (datos originales)
    private var gamelist: [Game] = []

    // Lista filtrada según la búsqueda
    private var filteredGames: [Game] = []

    // Controlador de búsqueda integrado en la barra de navegación
    private let searchController = UISearchController(searchResultsController: nil)

    // Guardar texto de búsqueda actual
    private var currentSearchText: String = ""

    
    
    
    
    // Método que se llama una vez que la vista ha sido cargada en memoria
    override func viewDidLoad() {
        super.viewDidLoad()

        // Configura el dataSource de la tabla para que sea este controlador
        tableView.dataSource = self

        // Configurar el UISearchController
        configureSearch()

        // Llama a la función que obtiene la lista de juegos de manera asíncrona
        Task {
            // Obtiene la lista de juegos desde el proveedor (API)
            let list = await GameProvider.getGameList()

            // Actualiza datos y recarga en el hilo principal
            DispatchQueue.main.async {
                self.gamelist = list
                self.applyFilterAndReload()
            }
        }
    }

    // MARK: - Configuración de búsqueda
    private func configureSearch() {
        // Mostrar el search bar en la navigation bar
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false

        // Configuraciones del search controller
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Buscar juegos por título"
        searchController.searchResultsUpdater = self
        definesPresentationContext = true
    }

    // Aplica el filtro según el texto actual y recarga la tabla
    private func applyFilterAndReload() {
        let text = currentSearchText.trimmingCharacters(in: .whitespacesAndNewlines)
        if text.isEmpty {
            filteredGames = gamelist
        } else {
            let lower = text.lowercased()
            filteredGames = gamelist.filter { $0.title.lowercased().contains(lower) }
        }
        tableView.reloadData()
    }

    // MARK: - Métodos de UITableViewDataSource

    /// Devuelve el número de filas a mostrar en la sección de la tabla.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredGames.count
    }

    /// Configura y proporciona la celda para una fila específica de la tabla.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Obtiene una celda reutilizable del tipo correcto
        let cell = tableView.dequeueReusableCell(withIdentifier: "Game Cell", for: indexPath) as! GameViewCell
        // Obtiene el juego correspondiente a la fila
        let game = filteredGames[indexPath.row]
        // Configura la celda con la información del juego
        cell.configure(with: game)
        return cell
    }

    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as! DetailViewController
        let indexPath = tableView.indexPathForSelectedRow!
        
        
        // variable de guardar de
        let game = filteredGames[indexPath.row]
        detailViewController.game = game

        // deseleccionar fila
        tableView.deselectRow(at: indexPath, animated: true)
    }
}






// MARK: - Actualización de resultados de búsqueda
extension ListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        currentSearchText = searchController.searchBar.text ?? ""
        applyFilterAndReload()
    }
}
