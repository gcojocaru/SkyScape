@propertyWrapper
struct FormattedTemperature {
    private var temperature: Double
    private let unit: TemperatureUnit

    enum TemperatureUnit {
        case celsius
        case fahrenheit

        var suffix: String {
            switch self {
            case .celsius:
                return "°C"
            case .fahrenheit:
                return "°F"
            }
        }
    }

    var wrappedValue: Double {
        get { temperature }
        set { temperature = newValue }
    }

    var projectedValue: String {
        switch unit {
        case .celsius:
            return "\(temperature)\(unit.suffix)"
        case .fahrenheit:
            let fahrenheitTemp = temperature * 9 / 5 + 32
            return "\(fahrenheitTemp)\(unit.suffix)"
        }
    }

    init(wrappedValue: Double, unit: TemperatureUnit = .celsius) {
        self.temperature = wrappedValue
        self.unit = unit
    }
}
