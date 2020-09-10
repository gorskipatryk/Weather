import UIKit

class ForecastViewController: UIViewController {

    // MARK: - Initialization

    init(city: City) {
        self.city = city
        super.init(nibName: nil, bundle: nil)
    }

    private(set) lazy var forecastView = ForecastView() |> UIView.backgroundColor(color: .white)

    // MARK: - Lifecycle

    override func loadView() {
        view = forecastView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSelf()
    }

    // MARK: - Private

    private let city: City

    private func setUpSelf() {
        title = city.name
    }

    // MARK: - Required initializer

    required init?(coder: NSCoder) { nil }
}
