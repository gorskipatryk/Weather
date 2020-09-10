import UIKit

class NavigationControllerFactory: NavigationControllerFactoryProtocol {

    // MARK: - NavigationControllerFactoryProtocol

    func makeNavigationController() -> UINavigationController {
        return UINavigationController() |> UINavigationController.default
    }
}
