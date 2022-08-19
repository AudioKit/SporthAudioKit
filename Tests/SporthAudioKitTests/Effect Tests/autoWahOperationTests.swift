// Copyright AudioKit. All Rights Reserved.

import AudioKit
import SoundpipeAudioKit
import SporthAudioKit
import XCTest

class AutoWahOperationTests: XCTestCase {
    func testAmplitude() {
        let engine = AudioEngine()
        let input = Oscillator(waveform: Table(.triangle))
        engine.output = OperationEffect(input) { $0.autoWah(wah: 0.5, amplitude: 0.5) }
        input.start()
        let audio = engine.startTest(totalDuration: 1.0)
        audio.append(engine.render(duration: 1.0))
        testMD5(audio)
    }

    func testWah() {
        let engine = AudioEngine()
        let input = Oscillator(waveform: Table(.triangle))
        engine.output = OperationEffect(input) { $0.autoWah(wah: 0.5) }
        input.start()
        let audio = engine.startTest(totalDuration: 1.0)
        audio.append(engine.render(duration: 1.0))
        testMD5(audio)
    }
}
