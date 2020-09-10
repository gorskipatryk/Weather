import Swinject
import SwinjectAutoregistration

class ApplicationAssembly: Assembly {

    func assemble(container: Container) {
        container.autoregister(WindowFactoring.self, initializer: WindowFactory.init)
    }
}
