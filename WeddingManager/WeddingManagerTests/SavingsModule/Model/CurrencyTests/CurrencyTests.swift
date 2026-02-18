//
//  CurrencyTests.swift
//  WeddingManagerTests
//
//  Created by Bartosz Jurczyk on 18/02/2026.
//

import Testing

@Suite("Currency enum tests")
struct CurrencyTests {

    struct CaseTests {
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
            #expect(currency.sign == "ZŁ", "PLN sign should be 'ZŁ'")
        }

        @Test("EUR values")
        func testEUR() async throws {
            let currency = Currency.eur
            #expect(currency.rateToUSD == 1.16, "EUR rateToUSD should be 1.16")
            #expect(currency.name == "EUR", "EUR name should be 'EUR'")
            #expect(currency.flag == "🇪🇺", "EUR flag should be 🇪🇺")
            #expect(currency.sign == "€", "EUR sign should be '€'")
        }

        @Test("USD values")
        func testUSD() async throws {
            let currency = Currency.usd
            #expect(currency.rateToUSD == 1.00, "USD rateToUSD should be 1.00")
            #expect(currency.name == "USD", "USD name should be 'USD'")
            #expect(currency.flag == "🇺🇸", "USD flag should be 🇺🇸")
            #expect(currency.sign == "$", "USD sign should be '$'")
        }
    }

    @Test("Currency.convert(amount:to:) performs correct conversion")
    func testCurrencyConvertMethod() async throws {
        // 50 PLN to USD: 50 * 0.27 / 1.00 = 13.5
        let plnToUsd = Currency.pln.convert(amount: 50, to: .usd)
        #expect(abs(plnToUsd - 13.5) < 0.0001, "50 PLN should be 13.5 USD")

        // 20 EUR to PLN: 20 * 1.16 / 0.27 = ~85.926
        let eurToPln = Currency.eur.convert(amount: 20, to: .pln)
        #expect(abs(eurToPln - 85.926) < 0.001, "20 EUR should be about 85.926 PLN")

        // 100 USD to EUR: 100 * 1.0 / 1.16 = ~86.2069
        let usdToEur = Currency.usd.convert(amount: 100, to: .eur)
        #expect(abs(usdToEur - 86.2069) < 0.0002, "100 USD should be about 86.2069 EUR")

        // 0 PLN to EUR: 0
        let zeroPlnToEur = Currency.pln.convert(amount: 0, to: .eur)
        #expect(zeroPlnToEur == 0, "0 PLN to EUR should be 0")
    }
}
