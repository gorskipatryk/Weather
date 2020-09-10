import UIKit

var delegateClass: String? = NSStringFromClass(AppDelegate.self)

if NSClassFromString("XCTestCase") != nil {
    delegateClass = nil
}

UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, delegateClass)
