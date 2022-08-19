// Copyright AudioKit. All Rights Reserved.

public extension ComputedParameter {
    /// Tracked amplitude
    ///
    /// - parameter input: Input audio signal
    ///
    func trackedAmplitude(_: OperationParameter = 0) -> Operation {
        return Operation(module: "rms", inputs: toMono())
    }
}
