import RxSwift
@testable import Weather

class CityListChildrenFactoryStub: CityListChildrenFactoryProtocol {
    func makeSearchViewController() -> SearchViewController {
        SearchViewController(debouncingScheduler: MainScheduler.instance)
    }
}
