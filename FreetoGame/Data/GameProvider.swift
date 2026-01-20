//
//  GameProvider.swift
//  FreetoGame
//
//  Created by Tardes on 20/1/26.
//

import Foundation

class GameProvider {
    //MARK: contsante
    

    
    
    //MARK: obtener JUEGUEJOS
    //HERRAminta que reliza el las llamadas de los json de manera automatica
    
    static func getGameList() async -> [Game] {
        // devulve todos el array de juegos
        let url = URL(string:"\(Constants.SERIVER_BASE_URL)/games")
        
        
        guard let url = url else {
            print("Invalid URL")
            return []
            
            
        }
        do  {
            let (data,_ ) = try await URLSession.shared.data(from: url)
            //  let JSONDecoder = try JSONSerialization.jsonObject(with: <#T##Data#>, )
            let result = try JSONDecoder().decode([Game].self, from: data)
            return result
            
        }
        catch {
            
            print("ayudaaa")
            return []
        }
    }
        
        //MARK: LLAMAR A UN JUEGO
       static func getGameByID( id: Int) async -> Game? {
            // esto devuleve el juego directamente
           let url = URL(string:"\(Constants.SERIVER_BASE_URL)/games?id=\(id)")
            
            guard let url = url else {
                print("Invakid url")
                return nil
            }
            do {
                let (data,_ ) = try await URLSession.shared.data(from: url)
                let result = try JSONDecoder().decode(Game.self, from: data)
                return result
            }
            catch {
                print("ayudaaa individual")
                return nil
                
            }
            
            
        }
        
    }
    

