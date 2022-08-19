// Copyright AudioKit. All Rights Reserved.

public extension Operation {
    /// Line Segment to change values over time
    ///
    /// - Parameters:
    ///   - start: Starting value
    ///   - end: Ending value
    ///   - duration: Length of time
    ///
    static func lineSegment(
        trigger: Operation,
        start: OperationParameter,
        end: OperationParameter,
        duration: OperationParameter
    ) -> Operation {
        return Operation(module: "line", inputs: trigger, start, duration, end)
    }

    /// Exponential Segment to change values over time
    ///
    /// - Parameters:
    ///   - start: Starting value
    ///   - end: Ending value
    ///   - duration: Length of time
    ///
    static func exponentialSegment(
        trigger: Operation,
        start: OperationParameter,
        end: OperationParameter,
        duration: OperationParameter
    ) -> Operation {
        return Operation(module: "expon", inputs: trigger, start, duration, end)
    }
}
