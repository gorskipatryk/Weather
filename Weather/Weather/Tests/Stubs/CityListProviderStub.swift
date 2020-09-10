@testable import Weather

class CityListProviderStub: CityListProviding {

    var cities: [City] {
        return [
            City(id: 1, name: "Test1", country: "TST1"),
            City(id: 2, name: "Test2", country: "TST2"),
            City(id: 3, name: "Test3", country: "TST3")
        ]
    }
}
