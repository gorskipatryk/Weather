import Foundation
import RxCocoa
import RxSwift

class ApiClient {

    // MARK: - Initialization

    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }

    func request<E: ApiRequest>(_ request: E) -> Observable<E.Resource> {
        return buildUrlRequest(for: request)
            .flatMap { [weak self] request -> Observable<Data> in
                guard let `self` = self else { return .error(GeneralError.selfReleased) }
                return self.urlSession.rx.data(request: request)
            }
            .map { response in return try request.parse(response) }
            .do(onError: { error in print("Network error: \(error)") })
    }

    // MARK: - Private

    private let urlSession: URLSession

    private func buildUrlRequest<E: ApiRequest>(for request: E) -> Observable<URLRequest> {
        guard let requestURL = url(for: request) else {
            return .error(NetworkClientError.urlBuildingError)
        }
        let request = request.urlRequest(from: requestURL)
        return .just(request)
    }

    private func url<E: ApiRequest>(for request: E) -> URL? {
        var urlComponents = URLComponents(string: request.url)
        urlComponents?.queryItems = queryItems(from: request)

        return urlComponents?.url
    }

    private func queryItems<E: ApiRequest>(from endpoint: E) -> [URLQueryItem]? {
        let apiKeyQuery = URLQueryItem(name: StaticParameter.apiKey, value: "45969d9700a32f98624a7b2ebe8499fc")
        let requestParameters = [apiKeyQuery]

        var endpointParameters = endpoint.urlParameters?.compactMap { key, value in
            URLQueryItem(name: key, value: value)
        }

        endpointParameters?.append(contentsOf: requestParameters)
        return endpointParameters
    }
}
