import Swinject
import SwinjectAutoregistration
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var assembler = Assembler([ApplicationAssembly()])
    var windowFactory: WindowFactoring
    var router: Router

    override init() {
        windowFactory = assembler.resolver ~> WindowFactoring.self
        router = assembler.resolver ~> Router.self
    }

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = windowFactory.makeWindow(rootViewController: router.navigationController)
        router.start()
        return true
    }
}
