//
//  ViewController.swift
//  iOs_PitchPerfect
//
//  Created by Priscilla Okawa on 23/8/18.
//  Copyright © 2018 Priscilla Okawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!
    
    @IBOutlet weak var recordButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var stopRecordingButton: UIButton!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear called")
    }



    @IBAction func recordAudio(_ sender: Any) {
        print ("Record button was pressed")
        recordingLabel.text = "Recording in Progress"
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        print ("Stop recording button was pressed")
    }
    
}

