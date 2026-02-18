// CurrencyValueTests.swift
// WeddingManagerTests
//
// Tests for the CurrencyValue struct, which represents an amount in a specific currency and supports conversion.

import Testing

@Suite("CurrencyValue tests")
struct CurrencyValueTests {
    @Test("CurrencyValue conversion using converted(to:)")
    func testCurrencyValueConverted() async throws {
        // 100 PLN to USD
        let valuePLN = CurrencyValue(amount: 100, currency: .pln)
        let valuePLNtoUSD = valuePLN.converted(to: .usd)
        #expect(abs(valuePLNtoUSD.amount - 27.0) < 0.0001, "100 PLN should convert to 27 USD")
        #expect(valuePLNtoUSD.currency == .usd, "Currency should be USD")

        // 50 USD to EUR
        let valueUSD = CurrencyValue(amount: 50, currency: .usd)
        let valueUSDtoEUR = valueUSD.converted(to: .eur)
        #expect(
            abs(valueUSDtoEUR.amount - 43.1034) < 0.0002,
            "50 USD should convert to ~43.1034 EUR"
        )
        #expect(valueUSDtoEUR.currency == .eur, "Currency should be EUR")
    }

    @Test("CurrencyValue identity conversion")
    func testIdentityConversion() async throws {
        let value = CurrencyValue(amount: 42.5, currency: .eur)
        let same = value.converted(to: .eur)
        #expect(abs(same.amount - 42.5) < 0.00001, "Same-currency conversion should be unchanged")
        #expect(same.currency == .eur, "Currency should be unchanged")
    }

    @Test("Zero amount conversion")
    func testZeroAmount() async throws {
        let value = CurrencyValue(amount: 0, currency: .pln)
        let converted = value.converted(to: .usd)
        #expect(converted.amount == 0, "Zero should always convert to zero")
        #expect(converted.currency == .usd, "Target currency should be correct")
    }

    @Test("CurrencyValue formatted string outputs")
    func testFormatting() async throws {
        let valuePLN = CurrencyValue(amount: 1234.5, currency: .pln)
        let valueEUR = CurrencyValue(amount: 9, currency: .eur)
        let valueUSD = CurrencyValue(amount: 42, currency: .usd)

        #expect(valuePLN.formatted(style: .plain) == "1234.50", ".plain outputs number only")
        #expect(valuePLN.formatted(style: .sign) == "ZŁ1234.50", ".sign outputs sign + number")
        #expect(valuePLN.formatted(style: .flag) == "🇵🇱 1234.50", ".flag outputs flag + number")
        #expect(
            valuePLN.formatted(style: .signAndFlag) == "🇵🇱 ZŁ1234.50",
            ".signAndFlag outputs flag, sign, number"
        )
        #expect(
            valueEUR.formatted(style: .sign, fractionDigits: 0) == "€9",
            "EUR with 0 fraction digits"
        )
        #expect(
            valueUSD.formatted(style: .signAndFlag, fractionDigits: 3) == "🇺🇸 $42.000",
            "USD with 3 fraction digits"
        )
    }
}
