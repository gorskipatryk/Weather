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
    let nameLabel = UILabel() |> UILabel.title
    let temperatureLabel = UILabel()
    let windLabel = UILabel() |> UILabel.subtitle

    // MARK: - Private

    private func setUpLayout() {
        backgroundColor = .white

        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(temperatureLabel)
        stackView.addArrangedSubview(windLabel)
        addSubview(stackView)

        stackView.topAnchor == topAnchor + 32
        stackView.horizontalAnchors == horizontalAnchors + 16
        stackView.bottomAnchor <= bottomAnchor
    }

    // MARK: - Required initializer

    required init?(coder: NSCoder) { nil }
}
