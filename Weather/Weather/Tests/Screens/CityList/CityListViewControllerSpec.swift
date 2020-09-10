import Nimble
import Quick
import SnapshotTesting
@testable import Weather

class CityListViewControllerSpec: QuickSpec {

    override func spec() {
        describe("CityListViewController") {
            var childrenFactoryStub: CityListChildrenFactoryStub!
            var cityListProviderStub: CityListProviderStub!
            var sut: CityListViewController!

            beforeEach {
                childrenFactoryStub = CityListChildrenFactoryStub()
                cityListProviderStub = CityListProviderStub()
                sut = CityListViewController(childrenFactory: childrenFactoryStub,
                                             cityListProvider: cityListProviderStub)
            }

            afterEach {
                childrenFactoryStub = nil
                cityListProviderStub = nil
                sut = nil
            }

            context("when view did load") {
                beforeEach {
                    _ = sut.view
                }

                it("should have correct snapshot") {
                    let navigationController = UINavigationController.snapshotFixture(root: sut)
                    assertSnapshot(matching: navigationController, as: .image(on: .iPhoneSe))
                }

                it("should have correct title") {
                    expect(sut.title) == "Wyszukaj miasto"
                }
            }
        }
    }
}
