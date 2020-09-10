import UIKit

extension UIStackView {

    static func vertical(spacing: CGFloat) -> (UIStackView) -> Void {
        return { stackView in
            stackView.axis = .vertical
            stackView.alignment = .leading
            stackView.distribution = .equalCentering
            stackView.spacing = spacing
        }
    }

}
