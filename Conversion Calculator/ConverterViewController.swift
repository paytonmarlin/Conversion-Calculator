//
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by Payton Marlin on 7/13/20.
//  Copyright © 2020 Payton Marlin. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    

    let alert = UIAlertController(title: "Choose Converter", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
    
    var currentConverter = 0
    
    // Create function to display the number shown when user taps on a number
    
    
    @IBOutlet weak var outputDisplay: UITextField!  //Created action to call for output
    
    @IBOutlet weak var inputDisplay: UITextField!   //Created action to cal for input
    
    
    @IBAction func clearButton(_ sender: Any) {
        inputDisplay.text = nil
        outputDisplay.text = nil
    }
    
    //Created a function that displays the alert when the user taps on the converter button
    @IBAction func converterTap(_ sender: Any)
    {
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func flipSign(_ sender: Any) {
        if let text = inputDisplay.text,
            var inputAsDouble = Double(text) {
            inputAsDouble *= -1
            inputDisplay.text = "\(inputAsDouble)"
            updateTextField()
        } else {
            inputDisplay.text = "-"
            outputDisplay.text = "-"
        }
    }
    
    
    @IBAction func numberButton(_ sender: UIButton) {
        inputDisplay.text?.append(sender.currentTitle!)
        updateTextField()
    }
    
    // Create a dictionary form the struct 'Converter' for all of the conversions
    var converters = [
        Converter(input: "°F", output: "°C"),
        Converter(input: "°C", output: "°F"),
        Converter(input: "mi", output: "km"),
        Converter(input: "km", output: "mi")
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for (index, converter) in converters.enumerated() {
            alert.addAction(UIAlertAction(title: converter.label, style: .default, handler: {
                (alertAction) -> Void in
                self.currentConverter = index
                self.inputDisplay.placeholder = converter.input
                self.outputDisplay.placeholder = converter.output
                self.updateTextField()
            }))
        }
        
        inputDisplay.placeholder = self.converters[0].input //Default placeholder value
        outputDisplay.placeholder = self.converters[0].output   //Default placeholder value
        
        // Do any additional setup after loading the view.
    }
    
    
    
    func milesToKilometers(_ miles: Double) -> Double {
        return 1.61 * miles
    }

    func kilometersToMiles(_ kilometers: Double) -> Double {
        return 0.62 * kilometers
    }

    func celciusToFarenheit(_ celcius: Double) -> Double {
        return celcius * (9/5) + 32
    }

    func farenheitToCelcius(_ fahrenheit: Double) -> Double {
        return (fahrenheit - 32) * (5/9)
    }

    func updateTextField() {
        
        if let text = inputDisplay.text,
            let input = Double(text) {

            var output: Double

            switch currentConverter {
                case 0:
                    output = farenheitToCelcius(input)
                case 1:
                    output = celciusToFarenheit(input)
                case 2:
                    output = milesToKilometers(input)
                case 3:
                    output = kilometersToMiles(input)
                default:
                    return
            }
    outputDisplay.text = "\(output)"

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
}
