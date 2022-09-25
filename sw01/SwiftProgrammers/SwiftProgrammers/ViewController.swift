//
//  ViewController.swift
//  SwiftProgrammers
//
//  Created by HSLU-N0004890 on 25.09.22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
           label.center = CGPoint(x: 180, y: 100)
           label.textAlignment = .center
           label.text = "Swift Programmers"

           self.view.addSubview(label)
    }
    
    func test() {
     var p = DataProvider()
        
    }


}

