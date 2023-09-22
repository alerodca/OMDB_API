//
//  APICall.swift
//  OMDB_API
//
//  Created by Alejandro Rodríguez Cañete on 21/9/23.
//

import Foundation

class APICall {
    func getMoviesOrSeries(search:String) {
        // Configura la URL con tu clave de API
        let apiKey = "TU_CLAVE_API"
        let urlString = "https://www.omdbapi.com/?apikey=\(apiKey)&t=The+Fast+and+the+Furious" // Ejemplo de búsqueda de una película por título

        if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error en la solicitud HTTP: \(error.localizedDescription)")
                    return
                }
                
                if let data = data {
                    // Procesa los datos de respuesta (parsing)
                    do {
                        let decoder = JSONDecoder()
                        let omdbResponse = try decoder.decode(OMDBResponse.self, from: data)
                        
                        // Ahora tienes los datos de la respuesta en objetos Swift (por ejemplo, omdbResponse.search[0].title)
                        for i in 0...10 {
                            print(omdbResponse.search[i].title)
                            print(omdbResponse.search[i].type)
                            print(omdbResponse.search[i].year)
                            print(omdbResponse.search[i].imdbID)
                            print(omdbResponse.search[i].poster)
                        }
                        // Actualiza la interfaz de usuario en el hilo principal (puedes usar DispatchQueue.main.async)
                    } catch {
                        print("Error al decodificar JSON: \(error.localizedDescription)")
                    }
                }
            }
            
            task.resume()
        }

    }
}
