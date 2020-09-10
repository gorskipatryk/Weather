import Swinject
import SwinjectAutoregistration
import UIKit

class ViewControllerFactory: ViewControllerFactoryProtocol {

    // MARK: - Initialization

    init(resolver: Resolver) {
        self.resolver = resolver
    }

    // MARK: - ViewControllerFactoryProtocol

    func makeCityListViewController() -> CityListViewController {
        resolver ~> CityListViewController.self
    }

    func makeForecastViewController(city: City) -> ForecastViewController {
        resolver ~> (service: ForecastViewController.self, argument: city)
    }

    // MARK: - Private

    private let resolver: Resolver
}
