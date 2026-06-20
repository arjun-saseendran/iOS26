//
//  PianoViewModel.swift
//  PianoApp
//
//  Created by Arjun Saseendran on 20/06/26.
//

import AudioKit
import Combine
import Observation
import SwiftUI

@MainActor
@Observable
final class PianoViewModel {
    private(set) var activeNotes: Set<MIDINoteNumber> = []
    private let audioManager: AudioManager = AudioManager.shared

    init() {
        Task {
            do {
                try await audioManager.setupAudio()
            } catch {
                print("Audio setup failed! \(error)")

            }
        }
    }
    func notePressed(_ note: PianoNote) {
        guard !activeNotes.contains(note.midiNote) else {
            return
        }
        activeNotes.insert(note.midiNote)
        Task {
            await audioManager.playNote(note: note.midiNote)

        }
    }
    func noteReleased(_ note: PianoNote) {
        activeNotes.remove(note.midiNote)
        Task {
            await audioManager.stopNote(note: note.midiNote)
        }
    }

    func isNoteActive(_ note: PianoNote) -> Bool {
        activeNotes.contains(note.midiNote)

    }
}
