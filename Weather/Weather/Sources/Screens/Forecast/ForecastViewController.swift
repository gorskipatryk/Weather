import RxCocoa
import RxSwift
import UIKit

class ForecastViewController: UIViewController {

    // MARK: - Initialization

    init(city: City, forecastService: ForecastServiceProtocol) {
        self.city = city
        self.forecastService = forecastService
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
        loadForecast()
    }

    // MARK: - Private

    private let city: City
    private let forecastService: ForecastServiceProtocol
    private let disposeBag = DisposeBag()

    private func setUpSelf() {
        title = city.name
    }

    private func loadForecast() {
        forecastService.getForecast(id: city.id)
            .subscribe(onSuccess: { forecast in print(forecast.name) })
            .disposed(by: disposeBag)
    }

    // MARK: - Required initializer

    required init?(coder: NSCoder) { nil }
}
