//: ## Plucked String Operation
//: Experimenting with a physical model of a string
//:
import AudioKit
import Foundation
import SporthAudioKit
import PlaygroundSupport
let playRate = 2.0

let pluckNode = OperationGenerator { parameters in
    let frequency = (Operation.parameters[0] + 40).midiNoteToFrequency()
    return Operation.pluckedString(
        trigger: Operation.trigger,
        frequency: frequency,
        amplitude: 0.5,
        lowestFrequency: 50)
}

var delay = Delay(pluckNode)
delay.time = Float(1.5 / playRate)
delay.dryWetMix = 50
delay.feedback = 20

let reverb = Reverb(delay)

let scale = [0, 2, 4, 5, 7, 9, 11, 12]

let engine = AudioEngine()
engine.output = reverb

try! engine.start()
pluckNode.start()


let t = Timer.scheduledTimer(withTimeInterval: 1.0 / playRate, repeats: true) { _ in

    var note = scale.randomElement()!
    let octave = [0, 1, 2, 3].randomElement()! * 12
    if (0...10).randomElement()! < 1 { note += 1 }
    if !scale.contains(note % 12) { Log("ACCIDENT!") }

    if (0...6).randomElement()! > 1 {
        pluckNode.$parameter1.value = AUValue(note + octave)
        pluckNode.trigger()
    }
}

PlaygroundPage.current.needsIndefiniteExecution = true


