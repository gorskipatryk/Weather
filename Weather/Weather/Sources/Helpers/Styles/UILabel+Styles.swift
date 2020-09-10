import UIKit

extension UILabel {

    static var error: (UILabel) -> Void {
        return { label in
            label.textColor = .red
            label.font = .systemFont(ofSize: 14, weight: .medium)
        }
    }

    static var title: (UILabel) -> Void {
        return { label in
            label.textColor = .black
            label.font = .systemFont(ofSize: 18, weight: .bold)
        }
    }

    static var subtitle: (UILabel) -> Void {
        return { label in
            label.textColor = .gray
            label.font = .systemFont(ofSize: 14, weight: .light)
        }
    }
}
