import UIKit

class NavigationViewController: UIViewController { // Rename to ResultsViewController if appropriate
    @IBOutlet weak var euroLabel: UILabel!
    @IBOutlet weak var poundLabel: UILabel!
    @IBOutlet weak var yenLabel: UILabel!
    @IBOutlet weak var wonLabel: UILabel!

    var convertedAmounts: [String: Double] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        updateCurrencyLabels()
    }

    private func updateCurrencyLabels() {
        euroLabel.text = "EUR: \(String(format: "%.2f", convertedAmounts["EUR", default: 0.0]))"
        poundLabel.text = "GBP: \(String(format: "%.2f", convertedAmounts["GBP", default: 0.0]))"
        yenLabel.text = "JPY: \(String(format: "%.2f", convertedAmounts["JPY", default: 0.0]))"
        wonLabel.text = "WON: \(String(format: "%.2f", convertedAmounts["WON", default: 0.0]))"
    }
}
