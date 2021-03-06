// Copyright AudioKit. All Rights Reserved.

extension ComputedParameter {

    /// Alter the average frequency of signal
    ///
    /// - Parameter semitones: Amount of shift
    ///
    public func pitchShift(semitones: OperationParameter = 0) -> Operation {
        return Operation(module: "1000 100 pshift", inputs: toMono(), semitones)
    }
}
