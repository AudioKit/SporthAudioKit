// Copyright AudioKit. All Rights Reserved.

// MARK: Numeric Protocol

/// Very simple protocol for anything with an intrinsic floating point value.
/// Allows constants to be passed into an AudioKit operation as well as other operations.
public protocol Numeric: OperationParameter {
    /// Raw value of the numeric parameter
    func value() -> Double
}

/// Numeric extension for doubles
extension Double: Numeric {
    /// Get basic value as a double
    public func value() -> Double {
        return Double(self)
    }
}
