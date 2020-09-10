import UIKit

class NavigationControllerFactory: NavigationControllerFactoryProtocol {

    // MARK: - Initialization

    init() {}

    // MARK: - NavigationControllerFactoryProtocol

    func makeNavigationController() -> UINavigationController {
        return UINavigationController() |> UINavigationController.default
    }
}
