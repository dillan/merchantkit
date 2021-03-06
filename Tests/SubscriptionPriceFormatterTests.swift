import XCTest
@testable import MerchantKit

class SubscriptionPriceFormatterTests : XCTestCase {
    private func englishResult(forPrice priceString: String, period: SubscriptionPeriod, phrasingStyle: SubscriptionPriceFormatter.PhrasingStyle, isFixedDuration: Bool) -> String {
        let locale = Locale(identifier: "en-US")
        let price = Price(from: NSDecimalNumber(string: priceString), in: locale)
        
        let formatter = SubscriptionPriceFormatter()
        formatter.locale = locale
        formatter.phrasingStyle = phrasingStyle
        formatter.isSubscriptionFixedDuration = isFixedDuration
        
        let result = formatter.string(from: price, period: period)
        
        return result
    }
    
    func test1DayInformalFixedDurationInEnglish() {
        let result = self.englishResult(forPrice: "1.99", period: .days(1), phrasingStyle: .informal, isFixedDuration: true)
        
        XCTAssertEqual(result, "$1.99 for 1 day")
    }
    
    func test1DayFormalFixedDurationInEnglish() {
        let result = self.englishResult(forPrice: "1.99", period: .days(1), phrasingStyle: .formal, isFixedDuration: true)

        XCTAssertEqual(result, "$1.99 for 1 day")
    }
    
    func test1DayInformalInEnglish() {
        let result = self.englishResult(forPrice: "1.99", period: .days(1), phrasingStyle: .informal, isFixedDuration: false)
        
        XCTAssertEqual(result, "$1.99 a day")
    }
    
    func test1DayFormalInEnglish() {
        let result = self.englishResult(forPrice: "1.99", period: .days(1), phrasingStyle: .formal, isFixedDuration: false)
        
        XCTAssertEqual(result, "$1.99 per day")
    }
    
    func test7DayInformalFixedDurationInEnglish() {
        let result = self.englishResult(forPrice: "1.99", period: .days(7), phrasingStyle: .informal, isFixedDuration: true)
        
        XCTAssertEqual(result, "$1.99 for 7 days")
    }
    
    func test7DayFormalFixedDurationInEnglish() {
        let result = self.englishResult(forPrice: "1.99", period: .days(7), phrasingStyle: .formal, isFixedDuration: true)
        
        XCTAssertEqual(result, "$1.99 for 7 days")
    }
    
    func test7DayInformalInEnglish() {
        let result = self.englishResult(forPrice: "1.99", period: .days(7), phrasingStyle: .informal, isFixedDuration: false)
        
        XCTAssertEqual(result, "$1.99 every 7 days")
    }
    
    func test7DayFormalInEnglish() {
        let result = self.englishResult(forPrice: "1.99", period: .days(7), phrasingStyle: .formal, isFixedDuration: false)
        
        XCTAssertEqual(result, "$1.99 every 7 days")
    }
    
    func test1MonthInformalFixedDurationInEnglish() {
        let result = self.englishResult(forPrice: "1.99", period: .months(1), phrasingStyle: .informal, isFixedDuration: true)
        
        XCTAssertEqual(result, "$1.99 for 1 month")
    }
    
    func test1MonthFormalFixedDurationInEnglish() {
        let result = self.englishResult(forPrice: "1.99", period: .months(1), phrasingStyle: .formal, isFixedDuration: true)
        
        XCTAssertEqual(result, "$1.99 for 1 month")
    }
    
    func test1MonthInformalInEnglish() {
        let result = self.englishResult(forPrice: "1.99", period: .months(1), phrasingStyle: .informal, isFixedDuration: false)
        
        XCTAssertEqual(result, "$1.99 a month")
    }
    
    func test1MonthFormalInEnglish() {
        let result = self.englishResult(forPrice: "1.99", period: .months(1), phrasingStyle: .formal, isFixedDuration: false)
        
        XCTAssertEqual(result, "$1.99 per month")
    }
    
    func test6MonthInformalFixedDurationInEnglish() {
        let result = self.englishResult(forPrice: "1.99", period: .months(6), phrasingStyle: .informal, isFixedDuration: true)
        
        XCTAssertEqual(result, "$1.99 for 6 months")
    }
    
    func test6MonthFormalFixedDurationInEnglish() {
        let result = self.englishResult(forPrice: "1.99", period: .months(6), phrasingStyle: .formal, isFixedDuration: true)
        
        XCTAssertEqual(result, "$1.99 for 6 months")
    }
    
    func test6MonthInformalInEnglish() {
        let result = self.englishResult(forPrice: "1.99", period: .months(6), phrasingStyle: .informal, isFixedDuration: false)
        
        XCTAssertEqual(result, "$1.99 every 6 months")
    }
    
    func test6MonthFormalInEnglish() {
        let result = self.englishResult(forPrice: "1.99", period: .months(6), phrasingStyle: .formal, isFixedDuration: false)
        
        XCTAssertEqual(result, "$1.99 every 6 months")
    }
    
    func test6MonthFormalInEnglishSpellOut() {
        let locale = Locale(identifier: "en-US")
        let price = Price(from: NSDecimalNumber(string: "1.99"), in: locale)
        
        let formatter = SubscriptionPriceFormatter()
        formatter.locale = locale
        formatter.phrasingStyle = .formal
        formatter.isSubscriptionFixedDuration = false
        formatter.unitCountStyle = .spellOut
        
        let result = formatter.string(from: price, period: .months(6))
        
        XCTAssertEqual(result, "$1.99 every six months")
    }
}
