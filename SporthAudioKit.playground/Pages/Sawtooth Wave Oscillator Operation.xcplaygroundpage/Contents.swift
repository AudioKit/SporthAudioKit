//: ## Sawtooth Wave Oscillator Operation
//: Maybe the most annoying sound ever. Sorry.
//:
import AudioKit
import SporthAudioKit
import PlaygroundSupport


//: Set up the operations that will be used to make a generator node

let generator = OperationGenerator { _ in
    let freq = Operation.jitter(amplitude: 200, minimumFrequency: 1, maximumFrequency: 10) + 200
    let amp = Operation.randomVertexPulse(minimum: 0, maximum: 0.3, updateFrequency: 1)
    return Operation.sawtoothWave(frequency: freq, amplitude: amp)
}

let engine = AudioEngine()
engine.output = generator

try! engine.start()
generator.start()

PlaygroundPage.current.needsIndefiniteExecution = true
