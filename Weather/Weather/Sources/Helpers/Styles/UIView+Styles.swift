import UIKit

extension UIView {

    static func backgroundColor(color: UIColor) -> (UIView) -> Void {
        return { $0.backgroundColor = color }
    }
}
