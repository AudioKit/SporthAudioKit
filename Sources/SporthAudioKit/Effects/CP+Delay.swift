// Copyright AudioKit. All Rights Reserved.

extension ComputedParameter {

    /// Add a delay to an incoming signal with optional feedback.
    ///
    /// - Parameters:
    ///   - time: Delay time, in seconds. (Default: 1.0, Range: 0 - 10)
    ///   - feedback: Feedback amount. (Default: 0.0, Range: 0 - 1)
    ///
    public func delay(time: Double = 1.0, feedback: OperationParameter = 0.0) -> Operation {
        return Operation(module: "delay",
                         inputs: toMono(), feedback, time)
    }
    
    /// Smooth variable delay line without varispeed pitch.
    ///
    /// - Parameters:
    ///   - time: Delay time (in seconds) that can be changed during performance. This value must not exceed the
    ///           maximum delay time. (Default: 1.0, Minimum: 0.0, Maximum: 10.0)
    ///   - samples: Interpolation samples (Default: 1024)
    ///   - feedback: Feedback amount. Should be a value between 0-1. (Default: 0.0, Minimum: 0.0, Maximum: 1.0)
    ///   - maximumDelayTime: The maximum delay time, in seconds. (Default: 5.0, Minimum: 0.0, Maximum: 10.0)
    ///
    public func smoothDelay(time: OperationParameter = 1.0,
                            feedback: OperationParameter = 0.0,
                            samples: Int = 1_024,
                            maximumDelayTime: Double = 5.0) -> Operation {
        return Operation(module: "smoothdelay",
                         inputs: toMono(), feedback, time, maximumDelayTime, Double(samples))
    }

    /// A delay line with cubic interpolation.
    ///
    /// - Parameters:
    ///   - time: Delay time (in seconds) that can be changed during performance. This value must not exceed the
    ///           maximum delay time. (Default: 1.0, Minimum: 0.0, Maximum: 10.0)
    ///   - feedback: Feedback amount. Should be a value between 0-1. (Default: 0.0, Minimum: 0.0, Maximum: 1.0)
    ///   - maximumDelayTime: The maximum delay time, in seconds. (Default: 5.0, Minimum: 0.0, Maximum: 10.0)
    ///
    public func variableDelay(time: OperationParameter = 1.0,
                              feedback: OperationParameter = 0.0,
                              maximumDelayTime: Double = 5.0) -> Operation {
        return Operation(module: "vdelay",
                         inputs: toMono(), feedback, time, maximumDelayTime)
    }
}
