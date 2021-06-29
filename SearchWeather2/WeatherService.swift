//
//  WeatherService.swift
//  SearchWeather2
//
//  Created by Field Employee on 6/20/21.
//

import Foundation

class WeatherService {
    
    private var dataTask: URLSessionDataTask?
    
    func getWeatherServiceData(city: String, completion: @escaping (Result<Welcome, Error>) -> Void) {
        
        
        
        

        let weatherURL = "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=8b1bc347e50bd2f0470da29df6faa148&units=metric"
           
           guard  let url = URL(string: weatherURL) else {return}

        
        // Create URL Session - work on the background
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            // Handle Error
            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                // Handle Empty Response
                print("Empty Response")
                return
            }
            print("Response status code: \(response.statusCode)")
            
            
            guard let data = data else {
                // Handle Empty Data
                print("Empty Data")
                return
            }
            
            do {
                // Parse the data
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Welcome.self, from: data)
                
                // Back to the main thread
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            } catch let error {
                completion(.failure(error))
            }
            
        }
        dataTask?.resume()
    }
}
