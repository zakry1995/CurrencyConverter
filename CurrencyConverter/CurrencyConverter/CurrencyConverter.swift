import Foundation

struct CurrencyConverter {
    private let rates: [String: Double] = ["EUR": 0.93, "GBP": 0.79, "JPY": 149.98, "WON": 1332.99]

    func convert(amount: Int, selections: [Bool]) -> [String: Double] {
        let currencies = ["EUR", "GBP", "JPY", "WON"]
        var results = [String: Double]()

        for (index, currency) in currencies.enumerated() {
            if selections[index] {
                results[currency] = Double(amount) * (rates[currency] ?? 0)
            }
        }

        return results
    }
}

