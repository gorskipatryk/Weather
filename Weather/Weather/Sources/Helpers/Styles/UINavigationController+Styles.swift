import UIKit

extension UINavigationController {

    static var `default`: (UINavigationController) -> Void {
        return {
            $0.navigationBar.isTranslucent = false
            $0.navigationBar.tintColor = .black
        }
    }
}
