//
//  PokePin.swift
//  PokemonGo
//
//  Created by Jeferson Bujaico on 5/21/19.
//  Copyright © 2019 JeffRay. All rights reserved.
//

import UIKit
import MapKit

class PokePin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var pokemon:Pokemon
    init(coord: CLLocationCoordinate2D, pokemon: Pokemon) {
        self.coordinate = coord
        self.pokemon = pokemon
    }
    
    
}
