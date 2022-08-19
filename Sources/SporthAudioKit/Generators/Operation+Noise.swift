// Copyright AudioKit. All Rights Reserved.

public extension Operation {
    /// Brownian noise generator
    ///
    /// - parameter amplitude: Overall level. (Default: 1.0, Minimum: 0, Maximum: 1.0)
    ///
    static func brownianNoise(amplitude: OperationParameter = 1.0) -> Operation {
        return Operation(module: "brown *", inputs: amplitude)
    }

    /// Faust-based pink noise generator
    ///
    /// - parameter amplitude: Overall level. (Default: 1.0, Minimum: 0, Maximum: 1.0)
    ///
    static func pinkNoise(amplitude: OperationParameter = 1.0) -> Operation {
        return Operation(module: "pinknoise", inputs: amplitude)
    }

    /// White noise generator
    ///
    /// - parameter amplitude: Overall level. (Default: 1.0, Minimum: 0.0, Maximum: 10.0)
    ///
    static func whiteNoise(amplitude: OperationParameter = 1.0) -> Operation {
        return Operation(module: "noise", inputs: amplitude)
    }
}
