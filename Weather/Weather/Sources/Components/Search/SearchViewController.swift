import RxCocoa
import RxSwift
import UIKit
import Validated

class SearchViewController: UIViewController {

    // MARK: - Initialization

    init(debouncingScheduler: SchedulerType) {
        self.debouncingScheduler = debouncingScheduler
        super.init(nibName: nil, bundle: nil)
    }

    private(set) lazy var searchView = SearchView()

    var cityName: Observable<String> {
        cityNameRelay.asObservable().map { $0.lowercased() }
    }

    // MARK: - Lifecycle

    override func loadView() {
        view = searchView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpValidation()
        setUpNameBinding()
    }

    // MARK: - Private

    private let disposeBag = DisposeBag()
    private let validationPresenter = ValidationPresenter()
    private let debouncingScheduler: SchedulerType
    private let cityNameRelay = PublishRelay<String>()

    private var validatedName: Observable<Validated<String, String>> {
        searchView.searchInput.rx.text
            .debounce(.milliseconds(500), scheduler: debouncingScheduler)
            .map { CityNameValidator.validate(name: $0) }
            .share()
    }

    private func setUpValidation() {
        validatedName
            .subscribe(onNext: { [unowned self] in self.present(result: $0) })
            .disposed(by: disposeBag)
    }

    private func setUpNameBinding() {
        validatedName
            .compactMap { $0.value }
            .bind(to: cityNameRelay)
            .disposed(by: disposeBag)
    }

    private func present(result: Validated<String, String>) {
        validationPresenter.presentValidationResult(validation: result, in: searchView)
    }

    // MARK: - Required initializer

    required init?(coder: NSCoder) { nil }
}
