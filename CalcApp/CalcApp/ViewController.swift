//
//  ViewController.swift
//  CalcApp
//
//  Created by Nikolay T on 01.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private let control: controllerfCalculator = controllerfCalculator()
    private let alertController = UIAlertController(title: "Ошибка", message: "", preferredStyle: .alert)
    private let act = UIAlertAction.init(title: "Ok", style: .cancel) { action in }
    @IBOutlet weak var textView: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.alertController.addAction(act)
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        textView.text = "0"
        resultLabel.text = ""
        control.resetValues()
    }
    
    @IBAction func pmButtonPressed(_ sender: UIButton) {
        if textView.text != "0" {
            guard let _ = textView.text else { return }
            if textView.text!.contains("-") {
                textView.text!.removeFirst()
            } else {
                textView.text!.insert("-", at: textView.text!.startIndex)
            }
        }
    }
    
    @IBAction func persentButtonPressed(_ sender: UIButton) {
        guard let _ = textView.text else { return }
        guard let currentValue: Float = Float(textView.text!) else { return }
        
        textView.text = String(currentValue / 100)
    }
    
    @IBAction func pointButtonPressed(_ sender: UIButton) {
        guard let _ = textView.text else { return }
        if !textView.text!.contains(".") {
            textView.text!.append(".")
        } else {
            textView.text!.remove(at: textView.text!.firstIndex(of: ".")!)
        }
    }
    
    @IBAction func zeroButtonPressed(_ sender: UIButton) {
        if textView.text != "0" {
            textView.text?.append("0")
        }
    }
    
    @IBAction func oneButtonPressed(_ sender: UIButton) {
        if textView.text != "0" {
            textView.text?.append("1")
        } else {
            textView.text = "1"
        }
    }
    
    @IBAction func twoButtonPressed(_ sender: UIButton) {
        if textView.text != "0" {
            textView.text?.append("2")
        } else {
            textView.text = "2"
        }
    }
    
    @IBAction func threeButtonPressed(_ sender: UIButton) {
        if textView.text != "0" {
            textView.text?.append("3")
        } else {
            textView.text = "3"
        }
    }
    
    @IBAction func fourButtonPressed(_ sender: UIButton) {
        if textView.text != "0" {
            textView.text?.append("4")
        } else {
            textView.text = "4"
        }
    }
    
    @IBAction func fiveButtonPressed(_ sender: UIButton) {
        if textView.text != "0" {
            textView.text?.append("5")
        } else {
            textView.text = "5"
        }
    }
    
    @IBAction func sixButtonPressed(_ sender: UIButton) {
        if textView.text != "0" {
            textView.text?.append("6")
        } else {
            textView.text = "6"
        }
    }
    
    @IBAction func sevenButtonPressed(_ sender: UIButton) {
        if textView.text != "0" {
            textView.text?.append("7")
        } else {
            textView.text = "7"
        }
    }
    
    @IBAction func eightButtonPressed(_ sender: UIButton) {
        if textView.text != "0" {
            textView.text?.append("8")
        } else {
            textView.text = "8"
        }
    }
    
    @IBAction func nineButtonPressed(_ sender: UIButton) {
        if textView.text != "0" {
            textView.text?.append("9")
        } else {
            textView.text = "9"
        }
    }
    
    @IBAction func divisionButtonPressed(_ sender: UIButton) {
        if control.getCurrentAction() != nil {
            resultLabel.text?.insert("(", at: resultLabel.text!.startIndex)
            resultLabel.text?.append(textView.text! + ")/")
            do {
            try control.getNumber(inputNumber: textView.text)
            } catch ErrorCalculus.divisionByZero {
                self.alertController.message = "Деление на 0 запрещено!"
                self.present(alertController, animated: true, completion: nil)
                
                textView.text = "0"
                resultLabel.text = ""
                control.resetValues()
            } catch {
                self.alertController.message = "Необрабатываемая ошибка"
                self.present(alertController, animated: true, completion: nil)
                
                textView.text = "0"
                resultLabel.text = ""
                control.resetValues()
            }
            control.setAction(inputAction: .division)
        } else {
            resultLabel.text?.append(textView.text! + "/")
            control.setAction(inputAction: .division)
            do {
            try control.getNumber(inputNumber: textView.text)
            } catch ErrorCalculus.divisionByZero {
                self.alertController.message = "Деление на 0 запрещено!"
                self.present(alertController, animated: true, completion: nil)
                
                textView.text = "0"
                resultLabel.text = ""
                control.resetValues()
            } catch {
                self.alertController.message = "Необрабатываемая ошибка"
                self.present(alertController, animated: true, completion: nil)
                
                textView.text = "0"
                resultLabel.text = ""
                control.resetValues()
            }
        }
        textView.text = "0"
    }
    
    @IBAction func multipleButtonPressed(_ sender: UIButton) {
        if control.getCurrentAction() != nil {
            resultLabel.text?.insert("(", at: resultLabel.text!.startIndex)
            resultLabel.text?.append(textView.text! + ")x")
            
            do {
            try control.getNumber(inputNumber: textView.text)
            } catch {
                self.alertController.message = "Необрабатываемая ошибка"
                self.present(alertController, animated: true, completion: nil)
                
                textView.text = "0"
                resultLabel.text = ""
                control.resetValues()
            }
            control.setAction(inputAction: .multiplication)
        } else {
            resultLabel.text?.append(textView.text! + ")x")
            control.setAction(inputAction: .multiplication)
            do {
            try control.getNumber(inputNumber: textView.text)
            } catch {
                self.alertController.message = "Необрабатываемая ошибка"
                self.present(alertController, animated: true, completion: nil)
                
                textView.text = "0"
                resultLabel.text = ""
                control.resetValues()
            }
        }
        textView.text = "0"
    }
    
    @IBAction func subtractionButtonPressed(_ sender: UIButton) {
        resultLabel.text?.append(textView.text! + "-")
        
        if control.getCurrentAction() != nil {
            do {
            try control.getNumber(inputNumber: textView.text)
            } catch {
                self.alertController.message = "Необрабатываемая ошибка"
                self.present(alertController, animated: true, completion: nil)
                
                textView.text = "0"
                resultLabel.text = ""
                control.resetValues()
            }
            control.setAction(inputAction: .subtraction)
        } else {
            control.setAction(inputAction: .subtraction)
            do {
            try control.getNumber(inputNumber: textView.text)
            } catch {
                self.alertController.message = "Необрабатываемая ошибка"
                self.present(alertController, animated: true, completion: nil)
                
                textView.text = "0"
                resultLabel.text = ""
                control.resetValues()
            }
            
        }
        textView.text = "0"
    }
    
    @IBAction func additionButtonPressed(_ sender: UIButton) {
        resultLabel.text?.append(textView.text! + "+")
        
        if control.getCurrentAction() != nil {
            do {
            try control.getNumber(inputNumber: textView.text)
            } catch {
                self.alertController.message = "Необрабатываемая ошибка"
                self.present(alertController, animated: true, completion: nil)
                
                textView.text = "0"
                resultLabel.text = ""
                control.resetValues()
            }
            control.setAction(inputAction: .addition)
        } else {
            control.setAction(inputAction: .addition)
            do {
            try control.getNumber(inputNumber: textView.text)
            } catch {
                self.alertController.message = "Необрабатываемая ошибка"
                self.present(alertController, animated: true, completion: nil)
                
                textView.text = "0"
                resultLabel.text = ""
                control.resetValues()
            }
        }
        textView.text = "0"
    }
    
    @IBAction func equalButtonPressed(_ sender: UIButton) {
        resultLabel.text?.append(textView.text!)
        do {
        try control.getNumber(inputNumber: textView.text)
        } catch ErrorCalculus.divisionByZero {
            self.alertController.message = "Деление на 0 запрещено!"
            self.present(alertController, animated: true, completion: nil)
            
            textView.text = "0"
            resultLabel.text = ""
            control.resetValues()
        } catch {
            self.alertController.message = "Необрабатываемая ошибка"
            self.present(alertController, animated: true, completion: nil)
            
            textView.text = "0"
            resultLabel.text = ""
            control.resetValues()
        }
        let result = control.getResult()
        
        if result != nil {
            let rounded = result!.rounded()
            if rounded == result! {
                textView.text = String(Int(rounded))
            } else {
                textView.text = String(result!)
            }
        }
    }
    
}

