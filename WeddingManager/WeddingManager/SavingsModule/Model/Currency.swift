//
//  Currency.swift
//  WeddingManager
//
//  Created by Bartosz Jurczyk on 13/02/2026.
//

import Foundation

enum Currency: Hashable, CaseIterable {
    case pln
    case eur
    case usd

    var rateToUSD: Double {
        switch self {
        case .pln: 0.27
        case .eur: 1.16
        case .usd: 1.00
        }
    }

    var name: String {
        switch self {
        case .pln:
            "PLN"
        case .eur:
            "EUR"
        case .usd:
            "USD"
        }
    }

    var flag: String {
        switch self {
        case .pln: "🇵🇱"
        case .eur: "🇪🇺"
        case .usd: "🇺🇸"
        }
    }
}
