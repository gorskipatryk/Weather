import UIKit

class TemperatureColorAdapter {

    func getColor(for temperature: Double) -> UIColor {
        switch temperature {
        case ...10:
            return .blue
        case 10...20:
            return .black
        case 20...:
            return .red
        default:
            return .yellow
        }
    }
}
