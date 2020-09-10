import RxSwift

protocol ForecastServiceProtocol {
    func getForecast(id: Int) -> Single<Forecast>
}
