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
    
    var resultNum: String = ""
    
    var numAfterResult: String = ""
    
    @IBAction func multiply(_ sender: Any) {
        operation = "*"
    }
    
    @IBAction func divide(_ sender: Any) {
        operation = "/"
    }
    
    @IBAction func subtract(_ sender: Any) {
        operation = "-"
    }
    
    @IBAction func addition(_ sender: Any) {
        operation = "+"
    }
    
    @IBAction func equals(_ sender: Any) {
        resultNum = String(doOperation())
        let numArray = resultNum.components(separatedBy: ".")
        if numArray[1] == "0" {
            numOnScreen.text = numArray[0]
        } else {
            numOnScreen.text = resultNum
        }
        numAfterResult = ""
    }

    @IBOutlet weak var numOnScreen: UILabel!
    
    @IBOutlet var calcButtons: [UIButton]!
    
    @IBAction func numPressed(_ sender: UIButton) {
        if operation == "" {
            firstNum += String(sender.tag)
            numOnScreen.text = firstNum
        } else if operation != "" && !haveResult {
            secondNum += String(sender.tag)
            numOnScreen.text = secondNum
        } else if operation != "" && haveResult {
            numAfterResult += String(sender.tag)
            numOnScreen.text = numAfterResult
        }
    }
    
    @IBAction func clear(_ sender: Any) {
        firstNum = ""
        operation = ""
        secondNum = ""
        haveResult = false
        resultNum = ""
        numAfterResult = ""
        numOnScreen.text = "0"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for button in calcButtons {
            button.layer.cornerRadius = button.frame.size.height / 2
            button.titleLabel?.font = UIFont(name: "System", size: 40)
        }
    }

    func doOperation() -> Double {
        if operation == "+" {
            if !haveResult {
                haveResult = true
                return Double(firstNum)! + Double(secondNum)!
            } else {
                return Double(resultNum)! + Double(numAfterResult)!
            }
        } else if operation == "-" {
            if !haveResult {
                haveResult = true
                return Double(firstNum)! - Double(secondNum)!
            } else {
                return Double(resultNum)! - Double(numAfterResult)!
            }
        } else if operation == "*" {
            if !haveResult {
                haveResult = true
                return Double(firstNum)! * Double(secondNum)!
            } else {
                return Double(resultNum)! * Double(numAfterResult)!
            }
        } else if operation == "/" {
            if !haveResult {
                haveResult = true
                return Double(firstNum)! / Double(secondNum)!
            } else {
                return Double(resultNum)! / Double(numAfterResult)!
            }
        }
        return 0
    }
}
