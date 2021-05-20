// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/AudioKit/

import AudioKit
import SporthAudioKit
import XCTest

class VocalTractOperationTests: XCTestCase {

    func testParameterSweep() {
        let engine = AudioEngine()
        let vocalTract = OperationGenerator {
            let line = Operation.lineSegment(
                trigger: Operation.metronome(),
                start: 0,
                end: 1,
                duration: 1.0)
            return Operation.vocalTract(frequency: 200 + 200 * line,
                                          tonguePosition: line,
                                          tongueDiameter: line,
                                          tenseness: line,
                                          nasality: line)
        }
        engine.output = vocalTract
        vocalTract.start()
        let audio = engine.startTest(totalDuration: 1.0)
        audio.append(engine.render(duration: 1.0))
        testMD5(audio)
    }

}
