import Anchorage
import UIKit

class ForecastView: UIView {

    // MARK: - Initializer

    init() {
        super.init(frame: .zero)
        setUpLayout()
    }

    // MARK: - Subviews

    let stackView = UIStackView() |> UIStackView.vertical(spacing: 24)

    // MARK: - Private

    private func setUpLayout() {
        backgroundColor = .white
    }

    // MARK: - Required initializer

    required init?(coder: NSCoder) { nil }
}
