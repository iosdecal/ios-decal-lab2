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
    
    /// The ID number to indicate which drum kit the user is playing
    private var drumKitID: Int
    
    /// Filenames for the available drum sounds for drum kit 0
    private static let drumKit0AudioFileNames = ["drumkit0-0.wav", "drumkit0-1.wav", "drumkit0-2.wav", "drumkit0-3.wav", "drumkit0-4.wav", "drumkit0-5.wav", "drumkit0-kick.wav"]
    
    /// Filenames for the available drum sounds for drum kit 1
    private static let drumKit1AudioFileNames = ["drumkit1-0.wav", "drumkit1-1.wav", "drumkit1-2.wav", "drumkit1-3.wav", "drumkit1-4.wav", "drumkit1-5.wav", "drumkit1-kick.wav"]
    
    
    init(drumKitID: Int) {
        self.drumKitID = drumKitID
    }

    /// Plays the audio file for drum associated with the given tag
    ///
    /// - Parameter tag: The tag of the drum button pressed
    func playDrumSound(forDrumWithTag tag: Int) {
        switch drumKitID {
            case 0:
                SystemSoundID.playSound(withFilename: DrumKit.drumKit0AudioFileNames[tag])
            case 1:
                SystemSoundID.playSound(withFilename: DrumKit.drumKit1AudioFileNames[tag])
            default:
                print("Error - drum kit \(drumKitID) does not exist.")
            }
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

