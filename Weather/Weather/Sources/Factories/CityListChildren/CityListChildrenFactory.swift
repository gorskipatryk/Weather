import Swinject
import SwinjectAutoregistration

class CityListChildrenFactory: CityListChildrenFactoryProtocol {

    // MARK: - Initialization

    init(resolver: Resolver) {
        self.resolver = resolver
    }

    // MARK: - CityListChildrenFactoryProtocol

    func makeSearchViewController() -> SearchViewController {
        resolver ~> SearchViewController.self
    }

    // MARK: - Private

    private let resolver: Resolver
}
