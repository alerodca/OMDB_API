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
                        // Convierte los datos en un objeto JSON
                        if let jsonObject = try JSONSerialization.jsonObject(with: dataResult, options: []) as? [String: Any] {
                            // Luego, puedes convertir el objeto JSON en un formato de datos JSON nuevamente
                            if let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) {
                                // jsonData ahora contiene tus datos en formato JSON
                                if let jsonString = String(data: jsonData, encoding: .utf8) {
                                    if let jsonData = jsonString.data(using: .utf8) {
                                        do {
                                            let objetos = try JSONDecoder().decode([OMDB].self, from: jsonData)
                                            // Ahora tienes un array de objetos de tipo Objeto
                                            for objeto in objetos {
                                                print("Title: \(objeto.title)")
                                                print("Type: \(objeto.type)")
                                                print("Image: \(objeto.poster)")
                                                print("Year: \(objeto.year)")
                                                print("-------------------------------------------")
                                            }
                                        } catch {
                                            print("Error al decodificar el JSON en objetos Objeto: \(error)")
                                        }
                                    }
                                }
                            }
                        }
                    } catch {
                        print("Error al convertir los datos en JSON: \(error)")
                    }
                }
                
            }.resume()
        }
    }
}
