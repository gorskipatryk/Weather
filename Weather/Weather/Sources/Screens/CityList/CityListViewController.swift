import RxSwift
import UIKit

class CityListViewController: UIViewController {

    // MARK: - Initialization

    init(childrenFactory: CityListChildrenFactoryProtocol) {
        self.childrenFactory = childrenFactory
        super.init(nibName: nil, bundle: nil)
    }

    private(set) lazy var cityListView = CityListView()

    // MARK: - Lifecycle

    override func loadView() {
        view = cityListView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        embed(searchController, inside: cityListView.searchView)
        setUpSelf()
    }

    // MARK: - Private

    private let childrenFactory: CityListChildrenFactoryProtocol
    private lazy var searchController = childrenFactory.makeSearchViewController()

    private func setUpSelf() {
        title = "Wyszukaj miasto"
    }

    // MARK: - Required initializer

    required init?(coder: NSCoder) { nil }
}
