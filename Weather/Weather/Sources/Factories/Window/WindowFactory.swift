import UIKit

class WindowFactory: WindowFactoring {

    // MARK: - WindowFactoring

    func makeWindow(rootViewController: UIViewController) -> UIWindow {
        let frame = CGRect(origin: .zero, size: UIScreen.main.bounds.size)
        let window = UIWindow(frame: frame)
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        return window
    }
}
