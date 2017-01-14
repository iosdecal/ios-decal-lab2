//
//  DrummerViewController.swift
//  Drummer
//
//  Created by Paige Plander on 1/13/17.
//  Copyright © 2017 iosdecal. All rights reserved.
//

import UIKit

class DrummerViewController: UIViewController {

    // Drum Kit 0 (Acoustic Drum Kit)
    let drumKit0 = DrumKit(drumKitID: 0)
    
    // Drum Kit 1 (Electronic Drum Kit)
    let drumKit1 = DrumKit(drumKitID: 1)
    
    // The currently selected drum kit (default = 0)
    var currentDrumKit: DrumKit?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // sets the default drum kit to drumkit0
        currentDrumKit = drumKit0
    }
    
    // YOUR CODE HERE


}
