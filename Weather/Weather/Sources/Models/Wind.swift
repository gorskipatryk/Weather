import Foundation

struct Wind: Decodable {
    let speed: Double
    let degrees: Double

    enum CodingKeys: String, CodingKey {
        case speed = "speed"
        case degrees = "deg"
    }
}
