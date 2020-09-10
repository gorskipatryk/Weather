import UIKit

class CityListProvider: CityListProviding {

    // MARK: - Initialization

    init(fileManager: FileManaging, jsonDecoder: JSONDecoder) {
        self.fileManager = fileManager
        self.jsonDecoder = jsonDecoder
    }

    // MARK: - CityListProviding

    private(set) lazy var cities: [City] = {
        guard let path = Bundle.main.path(forResource: "city_list", ofType: "json"),
            let json = fileManager.contents(atPath: path),
            let cities = try? jsonDecoder.decode([City].self, from: json) else {
                fatalError("Couldn't load city_list.json file")
        }

        return cities.sorted { $0.name < $1.name }
    }()

    // MARK: - Private

    private let fileManager: FileManaging
    private let jsonDecoder: JSONDecoder
}
