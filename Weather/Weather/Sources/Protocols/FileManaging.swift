import Foundation

public protocol FileManaging {
    func contents(atPath path: String) -> Data?
}

extension FileManager: FileManaging {}
