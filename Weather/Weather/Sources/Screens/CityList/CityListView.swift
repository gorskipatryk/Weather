import Anchorage
import UIKit

class CityListView: UIView {

    // MARK: - Initialization

    init() {
        super.init(frame: .zero)
        setUpLayout()
    }

    // MARK: - Subviews

    let tableView = UITableView() |> UITableView.citiesTableView
    let searchView = UIView() |> UIView.backgroundColor(color: .white)

    // MARK: - Layout

    private func setUpLayout() {
        addSubview(searchView)
        addSubview(tableView)

        searchView.topAnchor == safeAreaLayoutGuide.topAnchor
        searchView.horizontalAnchors == horizontalAnchors

        tableView.topAnchor == searchView.bottomAnchor
        tableView.horizontalAnchors == horizontalAnchors
        tableView.bottomAnchor == bottomAnchor
    }

    // MARK: - Required initializer

    required init?(coder: NSCoder) { nil }
}
