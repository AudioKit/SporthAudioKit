// Copyright AudioKit. All Rights Reserved.

public extension Operation {
    /// Save a value into the parameters array for using outside of the operation
    ///
    /// - parameter parameterIndex: Location in the parameters array to save this value
    ///
    func save(parameterIndex: Int) -> Operation {
        return Operation(module: "dup \(parameterIndex) pset", inputs: toMono())
    }
}
