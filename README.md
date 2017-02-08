# iOS DeCal - Lab 2 (AutoLayout) #

## Due Date ##
Tuesday, February 14th at 11:59 pm 

## Overview ##

In today's lab, we'll be creating a responsive UI for a simple drum pad app using AutoLayout. 

![alt text](/README-images/overview.gif)

To get started, first clone this repository onto your own computer:
	
	git clone https://github.com/iosdecal/ios-decal-lab2

Open the file `Drummer.xcodeproj` to start the lab.

## Part 1 - Getting Started ##
Once you have opened the project in Xcode, notice the files present in the Navigator.

### Files we have provided ###
We have provided the following files for you to use. 

1. `Drumkit.swift` in the `Model` folder - this file contains the "brains" of our app, including the filenames for the audio files that we'll be using, as well as a method for playing these audio files.
2. `DrummerViewController.swift` in the `Controller` folder - this file contains the ViewController class that will connect our View created in Interface Builder to our Model. You will be adding code to this file in this lab.
3. `Main.storyboard` in the `View` folder - this is where you will be creating your UI elements (buttons, labels, etc) and AutoLayout Constraints. This file is automatically created for you each time you start a new Xcode project.
4. `Assets.xcassets` in the `View` folder - contains all of the images used in the app (we have only included app icon images, but if you'd like to add your own images to customize the app, add them here). This is another file that is automatically created for you each time you create a new Xcode project.
5. `Supporting Files` - contains all the audio clips we'll be using, as well as some other files we won't be using in today's lab (Ask a lab assistant if you want to learn about them!)

Once you've become familiar with the files in our app, open Interface Builder (`Main.storyboard`). 

## Part 2 - Adding UI Elements to the View ##
We have a total of 7 drum sounds per drum kit provided, so we'll need to create 7 UI Buttons in our storyboard. 

Once you open your storyboard file, drag one 'Button' out from the `Object library` onto your empty View. 

![alt text](/README-images/part2-1.png)


You can edit how the button looks by opening the `Attributes Inspector`, which can be found in the Utilities sidebar to the right side of the screen. Feel free to customize the button as much as you want, but at minimum, change out the background color so that the buttons are easy to see. 

**Once you complete one button, create 6 others, and add them to your view in the following arrangement.** Since we want each button to play a unique sound, **give each button a unique integer tag from 0 to 6 (you can change a button's tag value using the Attributes Inspector**)

![alt text](/README-images/part2-2.png)


Before we start adding constraints, let's add two more UI elements.
**Add one Label and one Segmented Control to the bottom of your view**. These can both be found in the Object Library. We'll use these to switch between drum kits (different drum kits will have different sound files associated with them).

To clarify what the segmented control will be used for, **edit your UI Label to display "Drum Kit Type", and change the values of your Segmented Control to "Acoustic" and "Electronic"**

Your view should now look something like this: 
![alt text](/README-images/part2-3.png)


Try building your project now by pressing `Command + B` or the "Run" button at the top left corner of Xcode. You'll see that the UI looks different than it does in the Interface builder, and that there is a lot of extra white space. You can rotate the simulator by pressing `Hardware >  Rotate` to reveal some more UI issues. To fix these problems, we will use AutoLayout!

## Part 3 - Creating AutoLayout Constraints ##

For our app, we want to minimize the amount of whitespace by making the buttons as large as they possibly can be given the size of our screen. Instead of hard-coding in values for our buttons, we'll create constraints between each UI element. 

To refresh your memory , you can create constraints in Storyboard by first clicking on a UI element, holding down `Control` and then dragging your cursor to another UI element or view. To fine-tune your constraints, open the `Size Inspector` in the `Utilities` pane. Scroll downwards to view all constraints on your UI element.

**You may add as many or as few constraints as you wish, but you must ensure the following to get credit for this lab:**

1. Every button should stretch in width and height to fill the entire screen (no hardcoded values for height and width!)
2. All buttons must have the same height
3. The first 6 buttons should have the same width and height
4. The spacing (horizontal and vertical) between each button must be equal
5. The label and the segmented control should remain the same height, regardless of screen size (Constrain their heights to a certain value).

**Use the image below as a guide to make sure that you made your constraints correctly.** Even though the screenshot only shows the UI for an iPhone 7, your app's UI elements should resize for any device size).

![alt text](/README-images/endProduct.png)

You are free to customize your UI however you'd like, as long as the constraint requirements listed above are satisfied.

**If you're stuck at this step and want a more detailed walkthrough, you can find a step-by-step guide of adding constraints for this lab [here](https://github.com/paigeplan/lab2-autolayout-guide)**

## Part 4 - Connecting the View to the Model via a ViewController ##

Now that you've finished the UI, we can now connect our View to our Model. (Note: this portion of the lab is much shorter - you're almost done!)

### a. Creating Outlets for the Drum Buttons in DrummerViewController.swift ###

Now we can start connecting the UI elements we created in our Storyboard to our ViewController file so we can edit them programmatically. 

**Open the Assistant Editor so that `Main.storyboard` and `DrummerViewController.swift` are both open.** "DrummerViewController" is the custom controller class associated with the view in `Main.storyboard`. Usually, you will have to set each of your ViewController's custom classes in the Identity Inspector in Interface Builder on your own, but we have done this step for you.

Since we wan't our drum pad buttons to play an audio clip when pressed, we'll want to create an *action* in our ViewController for each button.

To do this, **highlight all 7 buttons in your Storyboard, then Control + Drag from them into `DrummerViewController.swift`. The Connection should be an *Action*, the sender type should be set to *UIButton*, and the function name should be set to "drumButtonWasPressed"** (see image below).

![alt text](/README-images/part4-2.png)

To check that all your buttons were successfully connected to the IBAction, hover over the small circle next to "drumButtonWasPressed" in DrummerViewController.swift. All 7 buttons should appear highlighted in your Storyboard. If they aren't all highlighted, **click the small icon next to your IBAction "drumButtonWasPressed", and drag from it to each unhighlighted button to connect them** (see image below).

![alt text](/README-images/part4-3.png)


### b. Adding Sound to our App ###

Now we have an action method that will be called any time a user taps one of the drum buttons. As of now, nothing will happen. Since we want a drum sound to be played each time a user taps a button, we'll need to add some code to this action method.

Luckily for you, this code has been implemented already in `Drummer.swift`, so simply **add the following code to your function "drumButtonWasPressed".**

	@IBAction func drumButtonWasPressed(_ sender: UIButton) {
        currentDrumKit?.playDrumSound(forDrumWithTag: sender.tag)
    }

This line of code calls the method "playDrumSound" for the currently selected drum kit. Each drum button will play a different sound based off of the button's tag number, which is accessed using "sender.tag". (Open up `DrumKit.swift` if you want more information). 

**Run your application and try pressing the drum buttons. Each button should play a different sound clip.** If all buttons play the same sound clip, make sure you set the "Tag" property for each button correctly in Part 2. 


### c. Adding Option to Switch between Drum Kits (OPTIONAL) ###

Right now, we can't switch between drum kits (tapping on the segmented control doesn't change anything). To fix this **create an IBAction in DrummerViewController.swift for the Segmented Control in the same way as done in Part 4a. Set the sender type to UISegmentedControl** You can name the method whatever you like, but we'll call it "drumKitWasChanged".

Note: If you an error saying "Could not find any information for class named DrummerViewController," you can manually type in the IBAction method in `DrummerViewController.swift`, then Click + drag from the action to the Segmented Control in your storyboard (copy and paste the code below for "drumKitWasChanged", then make the connection).


You should now have the following method in `DrummerViewController.swift`: 

    @IBAction func drumKitWasChanged(_ sender: UISegmentedControl) { }

**Fill in this method to allow the user to switch between drum kits by updating the "currentDrumKit" variable.** Hint: you'll want to use your UISegmentedControl property "selectedSegmentIndex", which you can access using "sender.selectedSegmentIndex"

If you implemented the method correctly, tapping on the Segmented Control in your app should change the sound of each drum button.

## Grading ##

Once you have finished, please submit your files to [Gradescope](https://gradescope.com/courses/5482) You will need to submit files EVEN if you are being checked off, since Gradescope does not support submission-less grading at the moment. You will need to submit a zip folder of all of your project files (compress and submit the folder you cloned from GitHub).

We will grade your work based off the following criteria (all requirements must be satisfied to receive credit).

1. All buttons and UI elements must dynamically change as shown in the preview gif for any device size and orientation (use the image in part 3 as a guide for how your app should look).
2. Tapping on a drum button must play a sound (your app needs to work!)

If both requirements are satisfied, congratulations on finishing Lab 2!  :) 
