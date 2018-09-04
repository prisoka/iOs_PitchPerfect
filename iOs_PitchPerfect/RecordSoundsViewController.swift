//
//  RecordSoundsViewController.swift
//  iOs_PitchPerfect
//
//  Created by Priscilla Okawa on 23/8/18.
//  Copyright © 2018 Priscilla Okawa. All rights reserved.
//

import UIKit
import AVFoundation // framework that contains the AVAudioRecorder

// a class in Swift can only inherit from ONE single superclass, but it can conform to as many as protocols as we want by listing them separated by coma.
class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    
    // add property AVAudioRecorder which gives the user the ability to use and ref. the audioRecorder in multiple places
    var audioRecorder: AVAudioRecorder!

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecordingButton.isEnabled = false
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear called")
    }

    @IBAction func recordAudio(_ sender: AnyObject) {
        print ("Recording button was pressed")
        recordingLabel.text = "Recording in Progress"
        stopRecordingButton.isEnabled = true
        recordButton.isEnabled = false
        
        // get the directory path to store the audio recording:
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        // we want to combines the dirPath w/ a filename for the recording
        let recordingName = "recordedVoice.wav"
        //the next 2 lines actually combines them dirPath and recordingName to create a full path to the file:
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        // now a audio session is set up using AVAudioSession.sharedInstance, created by default once app starts running
        let session = AVAudioSession.sharedInstance()
        // setting up the session for playing and recording the audio
        // try! = indicates that it doesn't handle any errors if this line of code fails.
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        // tell the AVAudioRecorderDelegate that the RecordSoundsViewController can act as its delegate
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    @IBAction func stopRecording(_ sender: AnyObject) {
        print ("Stop recording button was pressed")
        recordButton.isEnabled = true
        stopRecordingButton.isEnabled = false
        recordingLabel.text = "Tap to Record"
        // stop the audioRecorder
        audioRecorder.stop()
        // and set the shared AVAudioSession to inactive
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    // function to call the stopRecording Segue that was set up, and move to the audioplayback scene
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        print("Finished recording")
    }
    
}

