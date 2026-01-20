//
//  ViewController.swift
//  FreetoGame
//
//  Created by Tardes on 20/1/26.
//

import UIKit

class ListViewController: UIViewController,UITableViewDataSource {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var gamelist: [Game] = []
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        tableView.dataSource = self
        
        
        Task{
            
            
            gamelist = await GameProvider.getGameList()
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            /*
             let gamelist = await GameProvider.getGameList()
             let game = await GameProvider.getGameByID(id: 540)
             
             
             //guard let game = game else{
             print ( game)
             // print ( gamelist)
             */
            
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
