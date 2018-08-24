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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func recordAudio(_ sender: Any) {
        print ("Record button was pressed")
        recordingLabel.text = "Recording in Progress"
    }
}

