import RxSwift

class ForecastService: ForecastServiceProtocol {

    // MARK: - Initialization

    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }

    // MARK: - ForecastServiceProtocol

    func getForecast(id: Int) -> Single<Forecast> {
        let request = ForecastRequest(id: id)
        return apiClient.request(request).asSingle()
    }

    // MARK: - Private

    private let apiClient: ApiClient
}
