//
//  ViewController.swift
//  SearchWeather2
//
//  Created by Field Employee on 6/17/21.
//

import UIKit
import MapKit

class ViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    var weatherService1 = WeatherService()

    @IBOutlet weak var City: UITextField!
    
    @IBOutlet var mapView: MKMapView!
    
    @IBOutlet weak var tableview: UITableView!
    
    
    @IBAction func saveWeather(_ sender: UIButton) {
        // get value from text Field

        let cityText: String = City.text!
        print("This is the city they chose \(cityText)")
        cityArray.append(cityText)
        print(cityArray)
        tableview.reloadData()
        weatherService.getWeatherServiceData(city: "\(cityText)") {( result: Result<Welcome, Error> ) in
            DispatchQueue.main.async {
                guard case let .success(welcome) = result else { return }
                
                self.welcome = welcome
                print(welcome)
                let annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2D(latitude: welcome.coord?.lat ?? 0, longitude: welcome.coord?.lon ?? 0)
                self.mapView.addAnnotation(annotation)
            }
        }
        

//        weatherService.getWeatherServiceData { (result) in
//            print(result)
        
    }
    // save bookmark data to userDeafualts
  
    

    public var cityArray: [String?] = []
    
    var weatherService = WeatherService()
    
    var welcome: Welcome?
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableview.dataSource = self
        tableview.delegate = self
       
    }
    
    
    //Table View methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
        cell.textLabel!.text = cityArray[indexPath.row]
        return cell
    }
    
     func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableview.beginUpdates()
            cityArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "cityDataController") as!
            cityDataController
        vc.weather = welcome
        present(vc, animated: true)
        
    }
    
   
    
    
    
    
}

    
    

    
    
    

    



