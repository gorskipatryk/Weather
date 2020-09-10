struct ForecastRequest: ApiRequest {
    typealias Resource = Forecast

    var requestMethod: ApiRequestMethod = .GET
    var url: String = "https://api.openweathermap.org/data/2.5/weather"
    var urlParameters: [String: String]?

    private struct Key {
        static let id = "id"
    }

    init(id: Int) {
        urlParameters = [
            Key.id: "\(id)"
        ]
    }
}
