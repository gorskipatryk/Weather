import Foundation
import Validated

public enum CityNameValidator {

    // MARK: - Validation

    public static func validate(name: String?) -> Validated<String, String> {
        guard let name = name else {
            return .error("Wprowadź nazwę miasta")
        }

        guard name.range(of: nameRegex, options: .regularExpression) != nil else {
            return .error("Niepoprawna nazwa")
        }

        return .valid(name)
    }

    private static let nameRegex = "^[a-zA-ZÀ-ž\\s]*$"
}
