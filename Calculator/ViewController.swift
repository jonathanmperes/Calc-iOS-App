//
//  ViewController.swift
//  Calculator
//
//  Created by Jonathan Marcelo Peres on 10/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    var firstNum: String = ""
    
    var operation: String = ""
    
    var secondNum: String = ""
    
    var haveResult: Bool = false
    
    var resultNumber: String = ""
    
    var numAfterResult: String = ""

    @IBOutlet var calcButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for button in calcButtons {
            button.layer.cornerRadius = button.frame.size.height / 2
            button.titleLabel?.font = UIFont(name: "System", size: 40)
        }
    }


}
