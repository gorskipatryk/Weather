import UIKit

extension UITableView {

    static var citiesTableView: (UITableView) -> Void {
        return { tableView in
            tableView.backgroundColor = UIColor.white
            tableView.tableFooterView = UIView()
            // TODO: cell register
        }
    }
}
