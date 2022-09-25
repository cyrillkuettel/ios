//
//  DataProvider.swift
//  SwiftProgrammers
//
//  Created by HSLU-N0004890 on 25.09.22.
//

import Foundation
    
final class DataProvider: NSObject {
    
    static let sharedInstance = DataProvider()
    
    var memberPersons: Array<Person>
    var memberSurnames: Array<String>
    var memberNames: Array<String>

    private override init(){
        
      self.memberSurnames = ["Dr. Ruedi", "Hansjörg", "Nicolas", "Patricia", "Benjamin", "Ivan", "Raphael", "Dominik", "Jean", "Lenny", "Roman", "Floriano", "Simon", "Joseph", "Jeremias", "Manynouk", "Sarah", "Joy", "Cyrill", "Luca-Roberto", "Nando", "Rinoy", "Shend", "Samuel", "Omar", "Chantal", "Rajethan", "Leandro", "Moritz", "Lena", "Salome-Jael", "Lukas", "Filip", "Nicolas", "Lars", "Joël", "Martin", "Nizam"]
    
      self.memberNames = ["Arnold ", "Diethelm ", "Märki ", "Abderhalden ", "Anthamatten ", "Antunovic ", "Beck ", "Bieri ", "Luc Bittel ", "Budliger ", "Bürgler ", "Di Clemente", "Frei ", "Gallo ", "Jutz ", "Kaufmann ", "Kovacs ", "Kälin ", "Küttel ", "Lenz ", "Lüscher ", "Manavalan ", "Masurica ", "Nussbaumer ", "Oberholzer ", "Pichler ", "Ranjan ", "Rodrigues Carvalho ", "Philipp Röttger ", "Schiwitz ", "Steinegger ", "Stöckli ", "Tkaczyk ", "Vondru ", "Wüthrich ", "Zerzuben ", "Zwifl ", "Özdemir "]
        
        self.memberPersons = Array<Person>()
        for (name, surname) in zip(self.memberNames, self.memberSurnames) {
            let randomInt = Int.random(in: 1111..<9999)
            let p = Person(firstName: surname, lastName: name, plz: randomInt)
            self.memberPersons.append(p)
        }

    
    }

    
}

