//
//  ViewController.swift
//  Apple Calculator
//
//  Created by arthithai.aamlid on 8/2/2566 BE.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel = ViewModel()
    
    @IBOutlet weak var buttonAC: UIButton!
    @IBOutlet weak var buttonPositiveNegative: UIButton!
    @IBOutlet weak var buttonPercent: UIButton!
    @IBOutlet weak var buttonDivide: UIButton!
    @IBOutlet weak var buttonMultiply: UIButton!
    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var buttonAdd: UIButton!
    @IBOutlet weak var buttonEquals: UIButton!
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var buttonDecimal: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        makeButtonsRound(for: [buttonAC, button0, button1, button2, button3, button4, button5, button6, button7, button8, button9, buttonAdd, buttonMinus, buttonDivide, buttonMultiply, buttonEquals, buttonDecimal, buttonPercent, buttonPositiveNegative, buttonEquals])
        
        //self.view.sub
    }
    
    @IBOutlet weak var calculatorLabel: UILabel!
    
    @IBAction func buttonAC(_ sender: UIButton) {
        calculatorLabel.text = viewModel.reset()
    }
    
    @IBAction func buttonPositiveNegative(_ sender: UIButton) {
        calculatorLabel.text = viewModel.calculate(operatorType: .positiveNegativeSign)
    }
    
    @IBAction func buttonPercent(_ sender: UIButton) {
        calculatorLabel.text = viewModel.calculate(operatorType: .percentSign)
    }
    
    @IBAction func buttonDivide(_ sender: UIButton) {
        calculatorLabel.text = viewModel.calculate(operatorType: .divideSign)
    }
    
    @IBAction func buttonMultiply(_ sender: UIButton) {
        calculatorLabel.text = viewModel.calculate(operatorType: .multiplySign)
    }
    
    @IBAction func buttonMinus(_ sender: UIButton) {
        calculatorLabel.text = viewModel.calculate(operatorType: .minusSign)
    }
    
    @IBAction func buttonAdd(_ sender: UIButton) {
        calculatorLabel.text = viewModel.calculate(operatorType: .plusSign)
    }
    
    @IBAction func buttonEquals(_ sender: UIButton) {
        calculatorLabel.text = viewModel.equals()
    }
    
    @IBAction func button0(_ sender: UIButton) {
        calculatorLabel.text = viewModel.inputNumber(value: "0")
        //calculatorLabel.text = viewModel.calculate(buttonType: .number(value: "0"))
    }
    
    @IBAction func button1(_ sender: UIButton) {
        calculatorLabel.text = viewModel.inputNumber(value: "1")
    }
    
    @IBAction func button2(_ sender: UIButton) {
        calculatorLabel.text = viewModel.inputNumber(value: "2")
    }
    
    @IBAction func button3(_ sender: UIButton) {
        calculatorLabel.text = viewModel.inputNumber(value: "3")
    }
    
    @IBAction func button4(_ sender: UIButton) {
        calculatorLabel.text = viewModel.inputNumber(value: "4")
    }
    
    @IBAction func button5(_ sender: UIButton) {
        calculatorLabel.text = viewModel.inputNumber(value: "5")
    }
    
    @IBAction func button6(_ sender: UIButton) {
        calculatorLabel.text = viewModel.inputNumber(value: "6")
    }
    
    @IBAction func button7(_ sender: UIButton) {
        calculatorLabel.text = viewModel.inputNumber(value: "7")
    }
    
    @IBAction func button8(_ sender: UIButton) {
        calculatorLabel.text = viewModel.inputNumber(value: "8")
    }
    
    @IBAction func button9(_ sender: UIButton) {
        calculatorLabel.text = viewModel.inputNumber(value: "9")
    }
    
    @IBAction func buttonDecimal(_ sender: UIButton) {
        calculatorLabel.text = viewModel.inputNumber(value: ".")

    }
    
    func makeButtonsRound(for buttons: [UIButton]) {
        buttons.forEach {button in
            button.layer.cornerRadius = 41
            button.layer.masksToBounds = true
        }
    }
}
