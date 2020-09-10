import UIKit

extension UILabel {

    static var errorLabel: (UILabel) -> Void {
        return { label in
            label.textColor = .red
            label.font = .systemFont(ofSize: 14, weight: .medium)
        }
    }
}
