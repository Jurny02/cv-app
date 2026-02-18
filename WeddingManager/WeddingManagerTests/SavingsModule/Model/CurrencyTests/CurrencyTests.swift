//
//  CurrencyTests.swift
//  WeddingManagerTests
//
//  Created by Bartosz Jurczyk on 18/02/2026.
//

import Testing

@Suite("Currency enum tests")
struct CurrencyTests {
    @Test("Currency.allCases contains all currencies")
    func testAllCases() async throws {
        #expect(
            Currency.allCases == [.pln, .eur, .usd],
            "allCases should include .pln, .eur, .usd in order")
    }

    @Test("PLN values")
    func testPLN() async throws {
        let currency = Currency.pln
        #expect(currency.rateToUSD == 0.27, "PLN rateToUSD should be 0.27")
        #expect(currency.name == "PLN", "PLN name should be 'PLN'")
        #expect(currency.flag == "🇵🇱", "PLN flag should be 🇵🇱")
    }

    @Test("EUR values")
    func testEUR() async throws {
        let currency = Currency.eur
        #expect(currency.rateToUSD == 1.16, "EUR rateToUSD should be 1.16")
        #expect(currency.name == "EUR", "EUR name should be 'EUR'")
        #expect(currency.flag == "🇪🇺", "EUR flag should be 🇪🇺")
    }

    @Test("USD values")
    func testUSD() async throws {
        let currency = Currency.usd
        #expect(currency.rateToUSD == 1.00, "USD rateToUSD should be 1.00")
        #expect(currency.name == "USD", "USD name should be 'USD'")
        #expect(currency.flag == "🇺🇸", "USD flag should be 🇺🇸")
    }
}
