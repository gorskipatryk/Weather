import Anchorage
import UIKit

class CityListCell: UITableViewCell {

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpLayout()
    }

    // MARK: - Reuse

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        subtitleLabel.text = nil
    }

    // MARK: - Subviews

    let titleLabel = UILabel() |> UILabel.title
    let subtitleLabel = UILabel() |> UILabel.subtitle
    let labelsStackView = UIStackView() |> UIStackView.vertical(spacing: 4)

    // MARK: - Private

    private func setUpLayout() {
        selectionStyle = .none

        labelsStackView.addArrangedSubview(titleLabel)
        labelsStackView.addArrangedSubview(subtitleLabel)
        addSubview(labelsStackView)

        labelsStackView.verticalAnchors == verticalAnchors + 8
        labelsStackView.horizontalAnchors == horizontalAnchors + 16
    }

    // MARK: - Required initializer

    required init?(coder: NSCoder) { nil }
}
