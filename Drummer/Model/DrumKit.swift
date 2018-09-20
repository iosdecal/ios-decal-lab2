//
//  Drummer.swift
//  Drummer
//
//  Created by Paige Plander on 12/28/16.
//  Copyright © 2016 Paige Plander. All rights reserved.
//

import Foundation

/// Model class for drumkits (you will not need to edit this file, but it will help to read through it) 
class DrumKit {
    
    /// Filenames for the available drum sounds
    private static let drumKitAudioFileNames = ["drumkit-0.wav", "drumkit-1.wav", "drumkit-2.wav", "drumkit-3.wav", "drumkit-4.wav", "drumkit-5.wav", "drumkit-kick.wav"]



    /// Plays the audio file for drum associated with the given tag
    ///
    /// - Parameter tag: The tag of the drum button pressed
    func playDrumSound(forDrumWithTag tag: Int) {
            SystemSoundID.playSound(withFilename: DrumKit.drumKitAudioFileNames[tag])
    }
}


/// Framework used for sound playback (you can ignore the extension for this lab)
import AudioToolbox

extension SystemSoundID {
    static func playSound(withFilename filename: String) {
        var sound: SystemSoundID = 0
        if let soundURL = Bundle.main.url(forResource: filename, withExtension: nil) {
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &sound)
            AudioServicesPlaySystemSound(sound)
        }
    }
}

