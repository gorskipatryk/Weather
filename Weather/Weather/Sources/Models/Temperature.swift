import Foundation

struct Temperature: Decodable {
    let currentTemperature: Double
    let pressure: Double
    let humidity: Double

    enum CodingKeys: String, CodingKey {
        case currentTemperature = "temp"
        case pressure = "pressure"
        case humidity = "humidity"
    }
}
