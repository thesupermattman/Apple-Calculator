//
//  ViewController.swift
//  Apple Calculator
//
//  Created by arthithai.aamlid on 8/2/2566 BE.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var calculatorLabel: UILabel!
    
    @IBAction func buttonAC(_ sender: UIButton) {
        calculatorLabel.text = viewModel.reset()
    }
    
    @IBAction func buttonPositiveNegative(_ sender: UIButton) {
        calculatorLabel.text = viewModel.calculate(value: "+/-")
    }
    
    @IBAction func buttonPercent(_ sender: UIButton) {
        calculatorLabel.text = viewModel.calculate(value: "%")

    }
    
    @IBAction func buttonDivide(_ sender: UIButton) {
        calculatorLabel.text = viewModel.calculate(value: "/")
    }
    
    @IBAction func buttonMultiply(_ sender: UIButton) {
        calculatorLabel.text = viewModel.calculate(value: "*")
    }
    
    @IBAction func buttonMinus(_ sender: UIButton) {
        calculatorLabel.text = viewModel.calculate(value: "-")
    }
    
    @IBAction func buttonAdd(_ sender: UIButton) {
        calculatorLabel.text = viewModel.calculate(value: "+")
    }
    
    @IBAction func buttonEquals(_ sender: UIButton) {
        calculatorLabel.text = viewModel.equals()
    }
    
    @IBAction func button0(_ sender: UIButton) {
        calculatorLabel.text = viewModel.calculate(value: "0")
    }
    
    @IBAction func button1(_ sender: UIButton) {
        calculatorLabel.text = viewModel.calculate(value: "1")
    }
    
    @IBAction func button2(_ sender: UIButton) {
        calculatorLabel.text = viewModel.calculate(value: "2")
    }
    
    @IBAction func button3(_ sender: UIButton) {
        calculatorLabel.text = viewModel.calculate(value: "3")
    }
    
    @IBAction func button4(_ sender: UIButton) {
        calculatorLabel.text = viewModel.calculate(value: "4")
    }
    
    @IBAction func button5(_ sender: UIButton) {
        calculatorLabel.text = viewModel.calculate(value: "5")
    }
    
    @IBAction func button6(_ sender: UIButton) {
        calculatorLabel.text = viewModel.calculate(value: "6")
    }
    
    @IBAction func button7(_ sender: UIButton) {
        calculatorLabel.text = viewModel.calculate(value: "7")
    }
    
    @IBAction func button8(_ sender: UIButton) {
        calculatorLabel.text = viewModel.calculate(value: "8")
    }
    
    @IBAction func button9(_ sender: UIButton) {
        calculatorLabel.text = viewModel.calculate(value: "9")
    }
    
    @IBAction func buttonDecimal(_ sender: UIButton) {
        calculatorLabel.text = viewModel.calculate(value: ".")

    }
}
