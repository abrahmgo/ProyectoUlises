//
//  ViewController.swift
//  recording
//
//  Created by Andrés Bonilla Gómez on 02/05/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnRecord: UIButton!
    @IBOutlet weak var btnPlay: UIButton!
    
    private let record = Recording()
    private var isRecording = false
    private var isPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnPlay.isEnabled = false
    }
    
    @IBAction func record(_ sender: Any) {
        
        record.setupView(category: .record) { status, error in
            if self.isRecording {
                self.isRecording = false
                self.updateButtons(success: self.isRecording)
            } else {
                self.isRecording = true
                self.record.startRecording { status, error in
                    if status {
                        DispatchQueue.main.async {
                            self.btnRecord.setTitle("Tap to Stop", for: .normal)
                            self.btnPlay.isEnabled = false
                        }
                    } else {
                        self.updateButtons(success: false)
                    }
                }
            }
        }
        
    }
    
    @IBAction func play(_ sender: Any) {
        record.setupView(category: .playback) { status, error in
            if self.isPlaying {
                self.btnPlay.setTitle("Play", for: .normal)
                self.record.stop()
                self.isPlaying = false
                self.btnRecord.isEnabled = true
            } else {
                self.isPlaying = true
                self.btnRecord.isEnabled = false
                self.btnPlay.setTitle("Stop", for: .normal)
                self.record.preparePlayer { error in
                    guard let error = error else {
                        self.record.play()
                        return
                    }
                    
                    print(error)
                }
            }
        }
    }
    
    private func updateButtons(success: Bool) {
        record.finishRecording(success: success) { status in
            let text = status ? "Tap to Re-record" : "Tap to Record"
            DispatchQueue.main.async {
                self.btnRecord.setTitle(text, for: .normal)
                self.btnPlay.isEnabled = true
                self.btnRecord.isEnabled = true
            }
        }
    }
}

