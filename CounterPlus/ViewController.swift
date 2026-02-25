//
//  ViewController.swift
//  CounterPlus
//
//  Created by Влад Скрипченко on 24.02.26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var history: UITextView!
    @IBOutlet weak var label: UILabel!
    
    var historyArray: [String] = []
    var counter: Int = 0
    let now = Date()
    
    let timeFormatter: DateFormatter = {
            let df = DateFormatter()
            df.dateFormat = "dd.MM.yyyy HH:mm"
            return df
        }()
    
    @IBAction func resetButton(_ sender: Any) {
        counter = 0
        label.text = "\(counter)"
        
        let timeString = timeFormatter.string(from: Date())
        let message = "\(timeString): значение сброшено"

        historyArray.append(message)
        history.text = historyArray.joined(separator: "\n")
    }
    
    @IBAction func plus(_ sender: Any) {
        counter += 1
        label.text = "\(counter)"
        
        let timeString = timeFormatter.string(from: Date())
        let message = "\(timeString): значение изменено на +1"

        historyArray.append(message)
        history.text = historyArray.joined(separator: "\n")

    }
    
    @IBAction func minus(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            label.text = "\(counter)"
            let timeString = timeFormatter.string(from: Date())
            let message = "\(timeString): значение изменено на -1"

            historyArray.append(message)
            history.text = historyArray.joined(separator: "\n")
        } else {
            label.text = "\(counter)"
            let timeString = timeFormatter.string(from: Date())
            let message = "\(timeString): попытка уменьшить значение счётчика ниже 0"
            historyArray.append(message)
            history.text = historyArray.joined(separator: "\n")
        }
    }
    
}

