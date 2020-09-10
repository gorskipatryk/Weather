import UIKit

class CityListViewController: UIViewController {

    // MARK: - Initialization

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    private(set) lazy var cityListView = CityListView()

    // MARK: - Lifecycle

    override func loadView() {
        view = cityListView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSelf()
    }

    // MARK: - Private

    private func setUpSelf() {
        title = "Wyszukaj miasto"
    }

    // MARK: - Required initializer

    required init?(coder: NSCoder) { nil }
}
