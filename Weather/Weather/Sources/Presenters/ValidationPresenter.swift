import Validated

class ValidationPresenter {

    // MARK: - Initialization

    init() {}

    // MARK: - Validation

    func presentValidationResult(validation: Validated<String, String>, in view: InputView) {
        switch validation {
        case .valid:
            view.errorLabel.text = nil
            view.errorLabel.isHidden = true
        case .invalid(let errors):
            view.errorLabel.text = errors.joined()
            view.errorLabel.isHidden = false
        }
    }
}
