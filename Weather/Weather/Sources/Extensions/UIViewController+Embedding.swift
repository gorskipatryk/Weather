import Anchorage
import UIKit

extension UIViewController {

    func embed(_ childController: UIViewController, inside targetView: UIView) {
        addChild(childController)
        targetView.addSubview(childController.view)
        childController.view.edgeAnchors == targetView.edgeAnchors
        childController.didMove(toParent: self)
    }
}
