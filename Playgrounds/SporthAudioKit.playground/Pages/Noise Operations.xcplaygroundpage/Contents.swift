//: ## Noise Operations
//:
import AudioKit
import SporthAudioKit
import PlaygroundSupport

let generator = OperationGenerator { _ in
    let white = Operation.whiteNoise()
    let pink = Operation.pinkNoise()

    let lfo = Operation.sineWave(frequency: 0.3)
    let balance = lfo.scale(minimum: 0, maximum: 1)
    let noise = mixer(white, pink, balance: balance)
    return noise.pan(lfo)
}

let engine = AudioEngine()
engine.output = generator

try! engine.start()
generator.start()

PlaygroundPage.current.needsIndefiniteExecution = true
