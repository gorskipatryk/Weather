import Foundation

protocol ApiRequest {
    associatedtype Resource

    var requestMethod: ApiRequestMethod { get }
    var url: String { get }
    var urlParameters: [String: String]? { get }

    func parse(_ data: Data) throws -> Resource
}

enum ApiRequestMethod: String {
    case GET, POST
}

extension ApiRequest {
    func urlRequest(from url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = requestMethod.rawValue
        return request
    }
}

extension ApiRequest where Resource: Decodable {
    func parse(_ data: Data) throws -> Resource {
        return try JSONDecoder().decode(Resource.self, from: data)
    }
}

extension ApiRequest where Resource == Void {
    func parse(_ data: Data) throws -> Resource {
        return
    }
}
