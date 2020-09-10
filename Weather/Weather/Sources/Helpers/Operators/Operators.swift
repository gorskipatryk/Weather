//swiftlint:disable identifier_name

// MARK: - ForwardApplication

precedencegroup ForwardApplication {
    associativity: left
}

infix operator |>: ForwardApplication

public func |> <A, B>(x: A, f: (A) -> B) -> B {
    return f(x)
}

public func |> <A>(x: inout A, f: (inout A) -> Void) -> A {
    f(&x)
    return x
}

public func |> <A: AnyObject>(x: A, f: (A) -> Void) -> A {
    f(x)
    return x
}
