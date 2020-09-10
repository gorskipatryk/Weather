import UIKit

protocol ViewControllerFactoryProtocol {
    func makeCityListViewController() -> CityListViewController
    func makeForecastViewController(city: City) -> ForecastViewController
}
