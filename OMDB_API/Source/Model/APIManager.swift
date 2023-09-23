//
//  APICall.swift
//  OMDB_API
//
//  Created by Alejandro Rodríguez Cañete on 21/9/23.
//

import Foundation

class APICall {
    func getMoviesOrSeries(search:String) {
        // Example Correct URL  http://www.omdbapi.com/?apikey=525f6ef2&s=dragon ball z
        
        let endPoint = "https://www.omdbapi.com/?apikey=525f6ef2"
        let urlSession = URLSession.shared
        
        if let endPointURL = URL(string: "\(endPoint)&s=\(search)") {
            print("URL DE LA API: \(endPointURL)")
            
            urlSession.dataTask(with: endPointURL) { data, _, error in
                if let dataResult = data {
                    do {
                        let decoder = JSONDecoder()
                        let enternaiment = try decoder.decode(OMDBItem.self, from: dataResult)
                        
                        print(enternaiment)
                    } catch {
                        print("Error al convertir los datos en JSON: \(error)")
                    }
                }
                
            }.resume()
        }
    }
}
