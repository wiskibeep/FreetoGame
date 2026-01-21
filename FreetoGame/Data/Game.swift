//
//  Game.swift
//  FreetoGame
//
//  Created by Tardes on 20/1/26.
//

import Foundation

struct Game: Codable {
    
    let id: Int
    let title: String
    let thumbnail: String

    let shortDescription: String
    let gameURL: String
    let genre: String
    let platform: String
    let publisher: String
    let developer: String
    let releaseDate: String
    let profileURL: String
    
    
    // cuando no tengo datos ahoira pero los tendre
    let description : String?

    //Crear una un struct para desemvolver un json
    // ejemplo abrir una caja dentro de otra
    
    let systemRequirements : SystemRequirements?
    let screenshots : [Screenshot]?
    
    enum CodingKeys: String, CodingKey {
        case shortDescription = "short_description"
        case gameURL = "game_url"
        case releaseDate = "release_date"
        case profileURL = "freetogame_profile_url"
        case systemRequirements = "minimum_system_requirements"
        
        
        
        case id, title, thumbnail , genre, platform, publisher, developer, description, screenshots
    }
}

struct SystemRequirements: Codable {
    let os: String
    let processor: String
    let memory: String
    let storage: String
    let graphics: String
}

struct Screenshot: Codable {
    let image: String
}


/*
 //
 //  Game.swift
 //  FreetoGame
 //
 //  Created by Tardes on 20/1/26.
 //

 import Foundation


 struct Game: Codable {
     
     let id : Int
     let title : String
     let thumbnail : String

     
     let shortDescription : String
     let gameURL : String
     let genre : String
     let platform : String
     let publisher : String
     let developer : String
     let releaseDate : String
     let profileURL : String
     
     // cuando no tengo datos ahoira pero los tendre
     let descreption : String?
     
     //Crear una un struct para desemvolver un json
     // ejemplo abrir una caja dentro de otra
     
     let systemRequirements : SystemRequirements?
     let screenshots : [Screenshot]?
     
     
     enum CodingKeys: String, CodingKey {
         case shortDescription = "short_description"
         case gameURL = "game_url"
         case releaseDate = "release_date"
         case profileURL = "freetogame_profile_url"
         case systemRequirements = "minimum_system_requirements"
         
         
         
         case id, title, thumbnail , genre, platform, publisher, developer, description, screenshots
     }
 }


 // funcion externa para declarar las variables que se puede va a encontrar de un json dentro de un json


 struct SystemRequirements: Codable {
     let os: String
     let processor: String
     let memory: String
     let storage: String
     let graphics: String
     
     
 }


 struct Screenshot: Codable {
     let image: String
     
 }

 */
