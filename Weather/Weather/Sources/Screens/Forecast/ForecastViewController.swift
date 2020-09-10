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

    private(set) lazy var forecastView = ForecastView()

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
    private let temperatureColorAdapter = TemperatureColorAdapter()
    private let disposeBag = DisposeBag()

    private func setUpSelf() {
        title = city.name
    }

    private func loadForecast() {
        forecastService.getForecast(id: city.id)
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [unowned self] forecast in self.setUpData(forecast: forecast) })
            .disposed(by: disposeBag)
    }

    private func setUpData(forecast: Forecast) {
        forecastView.nameLabel.text = city.name
        forecastView.windLabel.text = "Prędkość wiatru: \(forecast.wind.speed) km/h"
        let currentTemperature = forecast.temperature.currentTemperature
        forecastView.temperatureLabel.text = "\(Int(currentTemperature)) °C"
        forecastView.temperatureLabel.textColor = temperatureColorAdapter.getColor(for: currentTemperature)
    }

    // MARK: - Required initializer

    required init?(coder: NSCoder) { nil }
}
