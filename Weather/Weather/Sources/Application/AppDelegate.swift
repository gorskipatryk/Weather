import Swinject
import SwinjectAutoregistration
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var assembler = Assembler([ApplicationAssembly()])
    var windowFactory: WindowFactoring

    override init() {
        windowFactory = assembler.resolver ~> WindowFactoring.self
    }

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let controller = UINavigationController()
        window = windowFactory.makeWindow(rootViewController: controller)
        return true
    }
}