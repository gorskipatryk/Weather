import Foundation

struct Forecast: Decodable {
    let temperature: Temperature
    let wind: Wind
    let id: Int
    let name: String

    private enum CodingKeys: String, CodingKey {
        case temperature = "main"
        case wind = "wind"
        case id = "id"
        case name = "name"
    }
}
