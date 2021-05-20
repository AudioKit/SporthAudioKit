import AVFoundation
import XCTest

extension XCTestCase {
    func testMD5(_ buffer: AVAudioPCMBuffer) {
        let localMD5 = buffer.md5
        let name = self.description
        XCTAssert(validatedMD5s[name] == buffer.md5, "\nFAILEDMD5 \"\(name)\": \"\(localMD5)\",")
    }
}

let validatedMD5s: [String: String] = [
    "-[AutoWahOperationTests testAmplitude]": "362e3f261952f0cc4df9713e40077f0f",
    "-[AutoWahOperationTests testWah]": "21f4d726d3145eeedd1861661fa5024d",
    "-[DelayOperationTests testDefault]": "ad1b433de4ec591cecb4c6ab4d91b7a5",
    "-[DelayOperationTests testFeedback]": "9da21169977f6ed9bd562820c2e8939f",
    "-[DelayOperationTests testParameters]": "615ed5bd20fdf38cc9710edcec7921fe",
    "-[DelayOperationTests testTime]": "9d3f5e4fb8b494e9c31afe05a5b8747b",
    "-[FMOscillatorOperationTests testFMOscillatorOperation]": "691ee890bdeee00f0b5e79d471fd82ee",
    "-[OperationGeneratorParametersTests testSetParameters]": "0b20180a92ea138d82977d4d38cf9524",
    "-[OperationGeneratorParametersTests testSetParameters2]": "90252f37c84a34a81155398a72cc172b",
    "-[OperationGeneratorParametersTests testSetParameters3]": "3bc8f1dd24129853970f9271d6694795",
    "-[PinkNoiseOperationTests testParameterSweep]": "ac20cbf3b0342430bab4350de2619feb",
    "-[ResonantFilterOperationTests testParameters1]": "084201aaf20c67dfc4867e0bae54e551",
    "-[ResonantFilterOperationTests testParameters2]": "50e835fabdf04c28c427bed060a0b674",
    "-[ResonantFilterOperationTests testParameters3]": "ec695c4db1e1e2714a4a908f9d95059a",
    "-[ReverberateWithCostelloTests testDefault]": "a123e2df39ef0d5a6161ccb2191b4646",
    "-[SmoothDelayTests testDefault]": "2ea423e3049f2b2d14d218f376a4542a",
    "-[SmoothDelayTests testFeedback]": "803a096f54a75509ac7a2e62f9ebc42f",
    "-[SmoothDelayTests testParameters]": "880f77bb6c10256c0889fe330d633cc8",
    "-[SmoothDelayTests testParameterSweep]": "ae10982f9d9a73b198e84820b84682c7",
    "-[SmoothDelayTests testTime]": "eb24180940df02842993b72b274e7e08",
    "-[ThreePoleLowPassFilterOperationTests testParameterSweep]": "57b05266ea3b6e74c4e0d03c58794caa",
    "-[TriangleTests testParameterSweep]": "65fc18963547c200e7154c987b2c73b7",
    "-[TriangleWaveTests testParameterSweep]": "e7d8cc44420bbf3474ff7fae34e6895b",
    "-[VariableDelayOperationTests testParameterSweep]": "8d4d8ed97e5bb0ee6ad9158337035f16",
    "-[VocalTractOperationTests testParameterSweep]": "e846c8d1a61587825d0c699d162e3cd0",
    "-[WhiteNoiseOperationTests testAmplitude]": "1fdb585751ad480ad39f16cae4589cf7",
    "-[WhiteNoiseOperationTests testParameterSweep]": "f8bf5004f0d3c528b491a65c7db78865",

]
