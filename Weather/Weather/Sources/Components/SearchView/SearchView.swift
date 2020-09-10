import Anchorage
import UIKit

class SearchView: UIView {

    // MARK: - Initialization

    init() {
        super.init(frame: .zero)
        setUpLayout()
    }

    // MARK: - Subviews

    let searchInput = UISearchBar()
    let errorLabel = UILabel() |> UILabel.errorLabel

    // MARK: - Layout

    private func setUpLayout() {
        addSubview(searchInput)
        addSubview(errorLabel)

        searchInput.topAnchor == topAnchor
        searchInput.horizontalAnchors == horizontalAnchors

        errorLabel.topAnchor == searchInput.bottomAnchor + 8
        errorLabel.horizontalAnchors == horizontalAnchors + 10
        errorLabel.bottomAnchor == bottomAnchor
    }

    // MARK: - Required initializer

    required init?(coder: NSCoder) { nil }
}
