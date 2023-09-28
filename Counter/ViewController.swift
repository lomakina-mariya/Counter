//
//  ViewController.swift
//  Counter
//
//  Created by Masha-MBP on 22.09.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var plusUIButton: UIButton!
    @IBOutlet weak var counterUILabel: UILabel!
    @IBOutlet weak var minusUIButton: UIButton!
    @IBOutlet weak var resetUIButton: UIButton!
    @IBOutlet weak var histotyUITextView: UITextView!
    private var sum: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        plusUIButton.layer.cornerRadius = 25
        minusUIButton.layer.cornerRadius = 25
        resetUIButton.layer.cornerRadius = 25
        
    }
    @IBAction func plusButtonDidTap(_ sender: Any) {
        sum += 1
        updateCounter()
        updateHistory(change: "Значение изменено на +1")
    }
    
    @IBAction func minusButtonDidTap(_ sender: Any) {
        if sum > 0 {
            sum -= 1
            updateCounter()
            updateHistory(change: "Значение изменено на -1")
        } else {
            updateHistory(change: "Попытка уменьшить значение ниже 0")
        }
    }
    
    @IBAction func resetButtonDidTap(_ sender: Any) {
        sum = 0
        updateCounter()
        updateHistory(change: "Значение сброшено")
    }
    
    func updateCounter() {
        counterUILabel.text = "Значение счетчика: \(sum)"
    }
    
    func updateHistory(change: String) {
        histotyUITextView.text.append("\n[\(getCurrentDate())] \(change)")
        histotyUITextView.scrollRangeToVisible(NSRange(location: -1, length: 1))
    }
    
    func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return dateFormatter.string(from: Date())
    }
}

