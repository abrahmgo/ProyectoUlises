//
//  Recording.swift
//  recording
//
//  Created by Andrés Bonilla Gómez on 02/05/22.
//

import Foundation
import AVFoundation

class Recording: NSObject, AVAudioRecorderDelegate, AVAudioPlayerDelegate {
    
    private let audioSession = AVAudioSession.sharedInstance()
    private var audioRecording: AVAudioRecorder?
    private var audioPlayer: AVAudioPlayer?
    
    // ask permission
    func setupView(category: AVAudioSession.Category,
                   completion: @escaping (_ status: Bool,
                                          _ error: Error?) -> ()) {
        do {
            try audioSession.setCategory(category, mode: .default)
            try audioSession.setActive(true)
            audioSession.requestRecordPermission() { allowed in
                completion(allowed, nil)
            }
        } catch {
            completion(false, error)
        }
    }
    
    func startRecording(completion: @escaping (_ status: Bool,
                                               _ error: Error?) -> ()) {
        let audioFilename = getFileURL()
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 96000,
            AVNumberOfChannelsKey: 2,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        do {
            audioRecording = try AVAudioRecorder(url: audioFilename,
                                                 settings: settings)
            audioRecording?.delegate = self
            audioRecording?.record()
            completion(true, nil)
        } catch {
            completion(false, error)
        }
    }
    
    func finishRecording(success: Bool,
                         completion: @escaping (_ status: Bool) -> ()) {
        audioRecording?.stop()
        audioRecording = nil
        completion(success)
    }
    
    func preparePlayer(completion: @escaping (_ error: Error?) -> ()) {
        var error: NSError?
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: getFileURL() as URL)
        } catch let error1 as NSError {
            error = error1
            audioPlayer = nil
        }
        
        if let err = error {
            print("AVAudioPlayer error: \(err.localizedDescription)")
            completion(err)
        } else {
            audioPlayer?.delegate = self
            audioPlayer?.prepareToPlay()
            audioPlayer?.volume = 100.0
            completion(nil)
        }
    }
    
    func play() {
        audioPlayer?.play()
    }
    
    func stop() {
        audioPlayer?.stop()
    }
}

extension Recording {
    
    // to save and geth path of audio
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func getFileURL() -> URL {
        let path = getDocumentsDirectory().appendingPathComponent("recording.m4a")
        return path as URL
    }
}
