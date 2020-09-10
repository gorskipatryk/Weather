import UIKit
@testable import Weather

extension UINavigationController {

    static func snapshotFixture(root rootController: UIViewController) -> UINavigationController {
        let controller = UINavigationController() |> UINavigationController.default
        controller.setViewControllers([rootController], animated: false)
        return controller
    }
}
