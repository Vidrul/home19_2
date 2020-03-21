
import Foundation



struct MoneyInfo: Codable {
    let success: Bool
    let timestamp: Int
    let base, date: String
    let rates: Rates
}

struct Rates: Codable {
    
    let usd: Double
    let eur: Double
    let rub: Double
    let byn: Double
    
    enum CodingKeys: String, CodingKey {
        case usd = "USD"
        case eur = "EUR"
        case rub = "RUB"
        case byn = "BYN"
    }
}




