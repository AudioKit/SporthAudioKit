// Copyright AudioKit. All Rights Reserved.

import AudioKit
import SporthAudioKit
import XCTest

class PinkNoiseOperationTests: XCTestCase {

    func testParameterSweep() {
        let engine = AudioEngine()
        let noise = OperationGenerator {
            let line = Operation.lineSegment(
                trigger: Operation.metronome(),
                start: 0,
                end: 1,
                duration: 1.0)
            return Operation.pinkNoise(amplitude: line)
        }
        engine.output = noise
        noise.start()
        let audio = engine.startTest(totalDuration: 1.0)
        audio.append(engine.render(duration: 1.0))
        testMD5(audio)
    }

}
