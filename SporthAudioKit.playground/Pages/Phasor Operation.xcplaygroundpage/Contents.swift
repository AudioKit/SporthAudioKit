//: ## Phasor Operation
//: Using the phasor to sweep amplitude and frequencies
//:
import AudioKit
import PlaygroundSupport
import SporthAudioKit

let interval: Double = 2
let noteCount: Double = 24
let startingNote: Double = 48 // C

let generator = OperationGenerator { _ in

    let frequency = (floor(Operation.phasor(frequency: 0.5) * noteCount) * interval + startingNote)
        .midiNoteToFrequency()

    let amplitude = (Operation.phasor(frequency: 0.5) - 1).portamento() // prevents the click sound

    let oscillator = Operation.sineWave(frequency: frequency, amplitude: amplitude)
    let reverb = oscillator.reverberateWithChowning()
    return mixer(oscillator, reverb, balance: 0.6)
}

let engine = AudioEngine()
engine.output = generator

try! engine.start()
generator.start()

PlaygroundPage.current.needsIndefiniteExecution = true
