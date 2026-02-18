// CurrencyValue.swift
// WeddingManager
//
// Represents a monetary value in a specific currency, suitable for expenses or savings tracking in a wedding app.

import Foundation

extension CurrencyValue {
    enum FormatStyle {
        case plain  // 100.00
        case sign  // ZŁ100.00
        case flag  // 🇵🇱 100.00
        case signAndFlag  // 🇵🇱 ZŁ100.00
    }
}

struct CurrencyValue: Equatable, Hashable {
    var amount: Double
    var currency: Currency

    // Convert to a different currency
    func converted(to target: Currency) -> CurrencyValue {
        let convertedAmount = currency.convert(amount: amount, to: target)
        return CurrencyValue(amount: convertedAmount, currency: target)
    }

    func formatted(style: FormatStyle = .sign, fractionDigits: Int = 2) -> String {
        let formattedAmount = String(format: "%.*f", fractionDigits, amount)
        switch style {
        case .plain:
            return formattedAmount
        case .sign:
            return "\(currency.sign)\(formattedAmount)"
        case .flag:
            return "\(currency.flag) \(formattedAmount)"
        case .signAndFlag:
            return "\(currency.flag) \(currency.sign)\(formattedAmount)"
        }
    }
}
