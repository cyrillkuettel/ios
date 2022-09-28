//
//  ViewController.swift
//  SwiftProgrammers
//
//  Created by HSLU-N0004890 on 25.09.22.
//

import UIKit

class ViewController: UIViewController {
    
    var currentYPos: Int = 120
    var step: Int = 18
    let dataprovider =  DataProvider.sharedInstance
    
    let usePersonData: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupAppTitle()
        
        if usePersonData {
            draw_persons()
        } else {
            draw_names_alternating()
        }
        
    }

    // 4. Label pro Teilnehmer zeichnen
    func draw_names_alternating() {

        
        let compute_pos_2 =  { (num: Int) -> (Int) in
            return num % 3
        }
        for (index, surname) in dataprovider.memberSurnames.enumerated() {
            
            addLabel(name: surname, position: compute_pos_2(index) )
            currentYPos += step
        }
    }
    
    // 6. memberPersons zeichnen
    func draw_persons() {
        for (index, person) in dataprovider.memberPersons.enumerated() {
            
            addLabel(person: person, position: index)
            currentYPos += step
        }
    }
    


    func addLabel(name: String, position: Int) {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 120, height: 22))
        switch position {
            case 0:
                label.center = CGPoint(x: 70, y: currentYPos)
                label.textColor = .systemGreen
            case 1:
                label.center = CGPoint(x: 200, y: currentYPos)
                label.textColor = .systemOrange
            case 2:
                label.center = CGPoint(x: 300, y: currentYPos)
                label.textColor = .systemMint
            default:
                label.center = CGPoint(x: 70, y: currentYPos)
        }
        
        label.textAlignment = .center
        label.text = name
        self.view.addSubview(label)
    }
    

    
    
    func addLabel(person: Person, position: Int) {
        
        addLabel(name: person.firstName, position: 0 )
        addLabel(name: person.lastName, position: 1 )
        addLabel(name: String(person.plz), position: 2 )

        currentYPos += step
    }
    
    
    func setupAppTitle() {
       let title = UILabel(frame: CGRect(x: 0, y: 100, width: 250, height: 30))
       title.center = CGPoint(x: 180, y: 100)
       title.textAlignment = .center
       title.textColor = .systemYellow
       
       title.font = title.font.withSize(25)
       
       title.text = "Swift Programmers"
       self.view.addSubview(title)
   }
   
}

