//
//  ViewController.swift
//  FreetoGame
//
//  Created by Tardes on 20/1/26.
//

import UIKit

class ListViewController: UIViewController {
    
    
    
    tableView: UITableView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Task{
            let gamelist = await GameProvider.getGameList()
            let game = await GameProvider.getGameByID(id:540)
            
            
           //guard let game = game else{
                print ( game)
              // print ( gamelist)
                
            }
            
            
        }
        
        
    }


