import Anchorage
import UIKit

class SearchView: UIView, InputView {

    // MARK: - Initialization

    init() {
        super.init(frame: .zero)
        setUpLayout()
    }

    var input: Input { searchInput }

    // MARK: - Subviews

    let searchInput = UISearchBar()
    let errorLabel = UILabel() |> UILabel.error

    // MARK: - Layout

    private func setUpLayout() {
        addSubview(searchInput)
        addSubview(errorLabel)

        searchInput.topAnchor == topAnchor
        searchInput.horizontalAnchors == horizontalAnchors

        errorLabel.topAnchor == searchInput.bottomAnchor
        errorLabel.horizontalAnchors >= horizontalAnchors
        errorLabel.centerXAnchor == centerXAnchor
        errorLabel.bottomAnchor == bottomAnchor
    }

    // MARK: - Required initializer

    required init?(coder: NSCoder) { nil }
}
