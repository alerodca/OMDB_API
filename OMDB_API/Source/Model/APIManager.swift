//
//  APICall.swift
//  OMDB_API
//
//  Created by Alejandro Rodríguez Cañete on 21/9/23.
//

import Foundation

class APICall {
    
    public var enternaiment: [OMDBItem] = []
    
    func getMoviesOrSeries(search:String) {
        // Example Correct URL  http://www.omdbapi.com/?apikey=525f6ef2&s=dragon ball z
        
        let endPoint = "https://www.omdbapi.com/?apikey=525f6ef2"
        let urlSession = URLSession.shared
        
        if let endPointURL = URL(string: "\(endPoint)&s=\(search)") {
            let task = urlSession.dataTask(with: endPointURL) { data, _, error in
                if let dataResult = data {
                    do {
                        let decoder = JSONDecoder()
                        let decode = try decoder.decode(OMDBResponse.self, from: dataResult)
                        
                        self.enternaiment = decode.Search ?? []
                        
                        if (decode.totalResults == "0") {
                            print("La API no ha devuelto ningún dato")
                        } else {
                            print("Nº de coincidencias: \(decode.totalResults)")
                        }
                    } catch {
                        print("Error al convertir los datos en JSON: \(error)")
                    }
                }
            }
            task.resume()
        }
    }
}
