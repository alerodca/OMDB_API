//
//  Model.swift
//  OMDB_API
//
//  Created by Alejandro Rodríguez Cañete on 21/9/23.
//

import Foundation

struct OMDBResponse: Codable {
    let Search: [OMDBItem]?
    let totalResults: String?
    let Response: String
}

struct OMDBItem: Codable {
    let title: String
    let year: String
    let imdbID: String
    let type: String
    let poster: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}

// THIS RETURN API

/*
 "Title": "Dragon Ball Z",
 "Year": "1989–1996",
 "imdbID": "tt0214341",
 "Type": "series",
 "Poster": "https://m.media-amazon.com/images/M/MV5BNGM5MTEyZDItZWNhOS00NzNkLTgwZTAtNWIzY2IzZmExOWMxXkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SX300.jpg"
 */
