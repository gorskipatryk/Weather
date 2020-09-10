import RxSwift
import Swinject
import SwinjectAutoregistration

class ApplicationAssembly: Assembly {

    func assemble(container: Container) {
        assembleFactories(container: container)
        assembleControllers(container: container)
        assembleProviders(container: container)
    }

    func assembleFactories(container: Container) {
        container.autoregister(WindowFactoring.self, initializer: WindowFactory.init)
        container.register(CityListChildrenFactoryProtocol.self) { CityListChildrenFactory(resolver: $0) }
    }

    func assembleControllers(container: Container) {
        container.register(SearchViewController.self) { _ in
            SearchViewController(debouncingScheduler: MainScheduler.instance)
        }
        container.autoregister(CityListViewController.self, initializer: CityListViewController.init)
        container.autoregister(ForecastViewController.self,
                               argument: City.self,
                               initializer: ForecastViewController.init)
    }

    func assembleProviders(container: Container) {
        container.register(CityListProviding.self) { _ in
            CityListProvider(fileManager: FileManager.default, jsonDecoder: JSONDecoder())
        }
    }

    func assembleServices(container: Container) {
        container.register(ApiClient.self) { _ in
            ApiClient(urlSession: URLSession.shared)
        }
        container.autoregister(ForecastServiceProtocol.self, initializer: ForecastService.init)
    }
}
