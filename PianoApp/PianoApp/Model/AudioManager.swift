//
//  AudioManager.swift
//  PianoApp
//
//  Created by Arjun Saseendran on 20/06/26.
//

import AVFoundation
import AudioKit
import Foundation
import SwiftUI

actor AudioManager {
    private var engine: AudioEngine?
    private var mixer: Mixer?
    private var sampler: MIDISampler?

    static let shared = AudioManager()

    private init() {}

    func setupAudio() throws {
        guard engine == nil else { return }
        engine = AudioEngine()
        mixer = Mixer()
        guard let mixer = mixer else {
            throw AudioError.setupFailed
        }
        sampler = MIDISampler(name: "Piano")
        if let sampler = sampler {
            mixer.addInput(sampler)
            engine?.output = mixer
        }
        try engine?.start()
    }
    func playNote(note: MIDINoteNumber, velocity: MIDIVelocity = 127) {
        sampler?.play(noteNumber: note, velocity: velocity, channel: .min)
    }
    func stopNote(note: MIDINoteNumber) {
        sampler?.stop(noteNumber: note, channel: .min)
    }
    enum AudioError: Error {
        case setupFailed

    }
}
