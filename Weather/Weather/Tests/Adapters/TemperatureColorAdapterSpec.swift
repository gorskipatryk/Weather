import Nimble
import Quick
@testable import Weather

class TemperatureColorAdapterSpec: QuickSpec {

    override func spec() {
        describe("TemperatureColorAdapter") {
            var sut: TemperatureColorAdapter!

            beforeEach {
                sut = TemperatureColorAdapter()
            }

            afterEach {
                sut = nil
            }

            context("when temperature is equal 5") {
                it("should return correct color") {
                    expect(sut.getColor(for: 5.0)) == UIColor.blue
                }
            }

            context("when temperature is equal 10") {
                it("should return correct color") {
                    expect(sut.getColor(for: 10.0)) == UIColor.blue
                }
            }

            context("when temperature is equal 11") {
                it("should return correct color") {
                    expect(sut.getColor(for: 11.0)) == UIColor.black
                }
            }

            context("when temperature is equal 15") {
                it("should return correct color") {
                    expect(sut.getColor(for: 15.0)) == UIColor.black
                }
            }

            context("when temperature is equal 20") {
                it("should return correct color") {
                    expect(sut.getColor(for: 20.0)) == UIColor.black
                }
            }

            context("when temperature is equal 21") {
                it("should return correct color") {
                    expect(sut.getColor(for: 21.0)) == UIColor.red
                }
            }

            context("when temperature is equal 553643463636535") {
                it("should return correct color") {
                    expect(sut.getColor(for: 553_643_463_636_535.0)) == UIColor.red
                }
            }

            context("when temperature is equal -453236324564355") {
                it("should return correct color") {
                    expect(sut.getColor(for: -453_236_324_564_355.0)) == UIColor.blue
                }
            }
        }
    }
}
