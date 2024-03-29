// Copyright AudioKit. All Rights Reserved.

import AudioKit
import SporthAudioKit
import XCTest

class TriangleWaveTests: XCTestCase {
    func testParameterSweep() {
        let engine = AudioEngine()
        let triangle = OperationGenerator {
            let ramp = Operation.lineSegment(
                trigger: Operation.metronome(),
                start: 1,
                end: 0,
                duration: 1.0
            )
            return Operation.triangleWave(frequency: ramp * 2000, amplitude: ramp)
        }
        engine.output = triangle
        triangle.start()
        let audio = engine.startTest(totalDuration: 1.0)
        audio.append(engine.render(duration: 1.0))
        testMD5(audio)
    }
}
