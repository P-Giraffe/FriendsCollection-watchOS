//
//  SolarSystem.swift
//  watchOS-Complication
//
//  Created by Johan Guenaoui on 19/05/2021.
//

import SwiftUI

struct Planet {
    private let _name:String
    private let _distance:Double
    
    init(name:String, distance:Double) {
        _name = name
        _distance = distance
    }
    
    func getName() -> String{
        return _name
    }
    
    func getDistance() -> Double {
        return round(_distance * 100)/100.0
    }
}

struct SolarSystem {
    private var _systemPlanet:[Planet]
    
    init(){
        _systemPlanet = [Planet(name: "Mercure", distance: 0.4), Planet(name: "Venus", distance: 0.7), Planet(name: "Terre", distance: 1.0), Planet(name: "Mars", distance: 1.5), Planet(name: "Jupiter", distance: 5.2), Planet(name: "Saturne", distance: 9.3), Planet(name: "Uranus", distance: 19.3), Planet(name: "Neptune", distance: 30.0), Planet(name: "Pluton", distance: 39.3)]
    }
    
    func getSystem() -> [Planet] {
        return _systemPlanet
    }
    
    func getPlanet(index:Int) -> Planet {
        return _systemPlanet[index]
    }
    
    func getCountPlanet(status:String?) -> Int {
        var countPlanet:Int
        
        switch(status) {
        case "far": countPlanet = _systemPlanet.filter {$0.getDistance() > 5}.count
        case "short": countPlanet = _systemPlanet.filter {$0.getDistance() < 5}.count
        default: countPlanet = _systemPlanet.count
        }
        
        return countPlanet
    }
}
