import RxCocoa
import RxDataSources
import RxSwift
import UIKit

class CityListViewController: UIViewController, ControllerOutputProducer {

    // MARK: - Initialization

    init(childrenFactory: CityListChildrenFactoryProtocol, cityListProvider: CityListProviding) {
        self.childrenFactory = childrenFactory
        self.cityListProvider = cityListProvider
        super.init(nibName: nil, bundle: nil)
    }

    private(set) lazy var cityListView = CityListView()

    // MARK: - Lifecycle

    override func loadView() {
        view = cityListView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        embedChildren()
        setUpSelf()
        setUpTableView()
        setUpTableSelection()
    }

    // MARK: - ControllerOutputProducer

    var output: Observable<ControllerOutput> {
        outputRelay.asObservable()
    }

    let disposeBag = DisposeBag()

    // MARK: - Private

    private let childrenFactory: CityListChildrenFactoryProtocol
    private let cityListProvider: CityListProviding
    private let outputRelay = PublishRelay<ControllerOutput>()
    private lazy var searchController = childrenFactory.makeSearchViewController()

    private func embedChildren() {
        embed(searchController, inside: cityListView.searchView)
    }

    private func setUpSelf() {
        title = "Wyszukaj miasto"
        navigationItem.backBarButtonItem = UIBarButtonItem.backButton
    }

    private func setUpTableView() {
        let data = Observable.combineLatest(Observable.just(cityListProvider.cities), searchController.cityName)
            .map { cities, query in cities.filter { $0.name.lowercased().starts(with: query) } }

        data.bind(to: cityListView.tableView.rx.items(cellIdentifier: "CityListCell")) { _, model, cell in
            guard let cell = cell as? CityListCell else { return }
            cell.titleLabel.text = model.name
            cell.subtitleLabel.text = model.country
        }
        .disposed(by: disposeBag)
    }

    private func setUpTableSelection() {
        cityListView.tableView.rx
            .modelSelected(City.self)
            .map { CityListViewControllerOutput.forecast(city: $0) }
            .bind(to: outputRelay)
            .disposed(by: disposeBag)
    }

    // MARK: - Required initializer

    required init?(coder: NSCoder) { nil }
}
