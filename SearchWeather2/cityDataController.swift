//
//  cityDataController.swift
//  SearchWeather2
//
//  Created by Field Employee on 6/24/21.
//

import UIKit


class cityDataController: UIViewController {
    
// Labels
    @IBOutlet weak var cityName: UILabel!
    
    @IBOutlet var temperature: UILabel!
    
    @IBOutlet var humidty: UILabel!
    
    @IBOutlet var ForeCast: UILabel!
    
    //variables
    
    // weather model
    var weather: Welcome?
    
    var cityService = WeatherService()
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        cityName.text = weather?.name
        temperature.text = "\(weather?.main?.temp)"
        humidty.text = "\(weather?.main?.humidity)"
        ForeCast.text = "\(weather?.main?.feelsLike)"
        
        
       
        
        
        
        
        
      
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

    
    
  
    
    

