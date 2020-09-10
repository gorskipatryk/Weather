import RxSwift
import UIKit

class Router {

    // MARK: - Initialization

    init(navigationControllerFactory: NavigationControllerFactoryProtocol,
         viewControllerFactory: ViewControllerFactoryProtocol) {
        self.navigationController = navigationControllerFactory.makeNavigationController()
        self.viewControllerFactory = viewControllerFactory
    }

    func start() {
        navigationController.setViewControllers([cityListViewController()], animated: true)
    }

    let navigationController: UINavigationController

    // MARK: - Private

    private let viewControllerFactory: ViewControllerFactoryProtocol

    private func cityListViewController() -> CityListViewController {
        let controller = viewControllerFactory.makeCityListViewController()
        controller.output
            .subscribe(onNext: { [unowned self] output in
                self.handleCityListControllerOutput(output: output)
            }).disposed(by: controller.disposeBag)
        return controller
    }

    private func forecastViewController(city: City) -> ForecastViewController {
        let controller = viewControllerFactory.makeForecastViewController(city: city)
        return controller
    }

    private func handleCityListControllerOutput(output: ControllerOutput) {
        guard let output = output as? CityListViewControllerOutput else { return }
        switch output {
        case .forecast(let city):
            navigationController.pushViewController(forecastViewController(city: city), animated: true)
        }
    }
}
