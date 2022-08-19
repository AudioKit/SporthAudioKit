// Copyright AudioKit. All Rights Reserved.

import AudioKit
import SoundpipeAudioKit
import SporthAudioKit
import XCTest

class ReverberateWithCostelloTests: XCTestCase {
    func testDefault() {
        let engine = AudioEngine()
        let input = Oscillator(waveform: Table(.triangle))
        engine.output = OperationEffect(input) { $0.reverberateWithCostello() }
        input.start()
        let audio = engine.startTest(totalDuration: 1.0)
        audio.append(engine.render(duration: 1.0))
        testMD5(audio)
    }
}
