import Nimble
import Quick
@testable import Weather

class CityNameValidatorSpec: QuickSpec {

    override func spec() {
        describe("CityNameValidator") {
            context("when entering ABCDEFGHIJK") {
                it("should validate properly") {
                    expect(CityNameValidator.validate(name: "ABCDEFGHIJK")) == .valid("ABCDEFGHIJK")
                }
            }

            context("when entering 12345") {
                it("should validate properly") {
                    expect(CityNameValidator.validate(name: "12345")) == .error("Niepoprawna nazwa")
                }
            }

            context("when entering A4329@!$4512") {
                it("should validate properly") {
                    expect(CityNameValidator.validate(name: "A4329@!$4512")) == .error("Niepoprawna nazwa")
                }
            }

            context("when entering _ABC") {
                it("should validate properly") {
                    expect(CityNameValidator.validate(name: "_ABC")) == .error("Niepoprawna nazwa")
                }
            }

            context("when entering ĄĆŻŹĘÓ") {
                it("should validate properly") {
                    expect(CityNameValidator.validate(name: "ĄĆŻŹĘÓ")) == .valid("ĄĆŻŹĘÓ")
                }
            }

            context("when entering !@#$%^&*()_+") {
                it("should validate properly") {
                    expect(CityNameValidator.validate(name: "!@#$%^&*()_+")) == .error("Niepoprawna nazwa")
                }
            }

            context("when entering ABC DEF GHI") {
                it("should validate properly") {
                    expect(CityNameValidator.validate(name: "ABC DEF GHI")) == .valid("ABC DEF GHI")
                }
            }

            context("when entering nil") {
                it("should validate properly") {
                    expect(CityNameValidator.validate(name: nil)) == .error("Wprowadź nazwę miasta")
                }
            }
        }
    }
}
