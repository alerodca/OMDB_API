//
//  Model.swift
//  OMDB_API
//
//  Created by Alejandro Rodríguez Cañete on 21/9/23.
//

import Foundation

struct OMDB: Codable {
    let title: String
    let year: String
    let type: String
    let poster: String
}

// THIS RETURN API

/*
 "Title": "Dragon Ball Z",
 "Year": "1989–1996",
 "imdbID": "tt0214341",
 "Type": "series",
 "Poster": "https://m.media-amazon.com/images/M/MV5BNGM5MTEyZDItZWNhOS00NzNkLTgwZTAtNWIzY2IzZmExOWMxXkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SX300.jpg"
 */
