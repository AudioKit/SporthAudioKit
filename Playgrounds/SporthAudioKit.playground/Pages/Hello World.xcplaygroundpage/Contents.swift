//: A simple playground to test SporthAudioKit makes sounds
import AudioKit
import SporthAudioKit
import PlaygroundSupport

let generator = OperationGenerator {

    // Generate a sine wave at the right frequency
    let crossingSignalTone = Operation.sineWave(frequency: 2_500)

    // Periodically trigger an envelope around that signal
    let crossingSignalTrigger = Operation.periodicTrigger(period: 0.2)
    let crossingSignal = crossingSignalTone.triggeredWithEnvelope(
        trigger: crossingSignalTrigger,
        attack: 0.01,
        hold: 0.1,
        release: 0.01)

    // scale the volume
    return crossingSignal * 0.2
}

let engine = AudioEngine()
engine.output = generator

try! engine.start()
generator.start()

PlaygroundPage.current.needsIndefiniteExecution = true
