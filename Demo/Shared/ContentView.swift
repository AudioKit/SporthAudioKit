import AudioKit
import AVFoundation
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            MasterView()
            DetailView()
        }.navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
}

struct MasterView: View {
    var body: some View {
        List {
            NavigationLink("Crossing Signal", destination: CrossingSignalView())
            NavigationLink("Drone Operation", destination: DroneOperationView())
            NavigationLink("Instrument Operation", destination: InstrumentOperationView())
            NavigationLink("LFO Operation", destination: LFOOperationView())
            NavigationLink("Phasor Operation", destination: PhasorOperationView())
            NavigationLink("Segment Operation", destination: SegmentOperationView())
            NavigationLink("Stereo Operation", destination: StereoOperationView())
        }

        .navigationTitle("AudioKit")
    }
}

struct DetailView: View {
    @State private var opacityValue = 0.0

    var body: some View {
        VStack(spacing: 0) {
            Text("Please select a recipe from the left-side menu.")
                .font(.system(.body, design: .rounded))
        }
    }
}
