import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var eurSwitch: UISwitch!
    @IBOutlet weak var gbpSwitch: UISwitch!
    @IBOutlet weak var jpySwitch: UISwitch!
    @IBOutlet weak var wonSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
    }

    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let amountText = amountTextField.text, let amount = Int(amountText) else {
            errorLabel.isHidden = false
            errorLabel.text = "Please enter a valid integer amount."
            return
        }
        errorLabel.isHidden = true
        performSegue(withIdentifier: "showResultsSegue", sender: amount)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResultsSegue",
           let destinationVC = segue.destination as? NavigationViewController,  // Replace with actual class name if different
           let amount = sender as? Int {
            let selections = [eurSwitch.isOn, gbpSwitch.isOn, jpySwitch.isOn, wonSwitch.isOn]
            let converter = CurrencyConverter()
            destinationVC.convertedAmounts = converter.convert(amount: amount, selections: selections)
        }
    }
}
