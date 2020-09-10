import Nimble
import Quick
@testable import Weather

class WindowFactorySpec: QuickSpec {

    override func spec() {
        describe("WindowFactory") {
            var sut: WindowFactory!

            beforeEach {
                sut = WindowFactory()
            }

            afterEach {
                sut = nil
            }

            context("when creating window") {
                var viewController: UIViewController!
                var window: UIWindow!

                beforeEach {
                    viewController = UIViewController()
                    window = sut.makeWindow(rootViewController: viewController)
                }

                afterEach {
                    viewController = nil
                    window = nil
                }

                it("should create window") {
                    expect(window).toNot(beNil())
                }

                it("should set correct root controller") {
                    expect(window.rootViewController) == viewController
                }

                it("should make window key") {
                    expect(window.isKeyWindow) == true
                }

                it("should set correct frame") {
                    expect(window.frame) == CGRect(origin: .zero, size: UIScreen.main.bounds.size)
                }
            }
        }
    }
}
