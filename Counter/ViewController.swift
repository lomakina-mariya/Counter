
import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak private var plusUIButton: UIButton!
    @IBOutlet weak private var counterUILabel: UILabel!
    @IBOutlet weak private var minusUIButton: UIButton!
    @IBOutlet weak private var resetUIButton: UIButton!
    @IBOutlet weak private var historyUITextView: UITextView!
    private var sum: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        plusUIButton.layer.cornerRadius = 25
        minusUIButton.layer.cornerRadius = 25
        resetUIButton.layer.cornerRadius = 25
    }
    
    private func updateCounter() {
        counterUILabel.text = "Значение счетчика: \(sum)"
    }
    
    private func updateHistory(change: String) {
        historyUITextView.text.append("\n[\(getCurrentDate())] \(change)")
        historyUITextView.scrollRangeToVisible(NSRange(location: -1, length: 1))
    }
    
    private func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return dateFormatter.string(from: Date())
    }
    
    @IBAction private func plusButtonDidTap(_ sender: Any) {
        sum += 1
        updateCounter()
        updateHistory(change: "Значение изменено на +1")
    }
    
    @IBAction private func minusButtonDidTap(_ sender: Any) {
        if sum > 0 {
            sum -= 1
            updateCounter()
            updateHistory(change: "Значение изменено на -1")
        } else {
            updateHistory(change: "Попытка уменьшить значение ниже 0")
        }
    }
    
    @IBAction private func resetButtonDidTap(_ sender: Any) {
        sum = 0
        updateCounter()
        updateHistory(change: "Значение сброшено")
    }
    
    
}

