//
//  AudioBoxRec.swift
//  Home-Studio-Radio
//
//  Created by Carlos Mbendera on 14/05/2024.
//

import AVFoundation
import Foundation




class AudioBox: ObservableObject{
    
    
    @Published var status : AudioStatus = .stopped
    
     var isRecording : Bool{
        status == .recording
    }
    
    var audioRecorder : AVAudioRecorder?
    var audioPlayer : AVAudioPlayer?
    
    var URLForRec : URL{
        let fileManager = FileManager.default
        let tempDir = fileManager.temporaryDirectory
        let path = tempDir.appendingPathComponent("Recording.caf")
        
        return path
    }
    
    
    func setUpAudioSession(){
        //MARK: Mac OS Doesn't seem to use AV Audio Session. So not using this until testing out other functions
     //   let audioSession = AVAudioSession.sharedInstance()
    }
    
    func setUpRecorder(){
        let recorderSettings : [String : Any] = [
            AVFormatIDKey: Int(kAudioFormatLinearPCM),
            AVSampleRateKey: 44100.0,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        
        do{
           try audioRecorder = AVAudioRecorder(url: URLForRec, settings: recorderSettings)
            //MARK: I'd set up Audio Session Here
            //setUpAudioSession()
        }catch{
            print("Set Up Recorder, Something Got Real Messed Up: \(error)")
        }
        
        
    }
    
    func record(){
        audioRecorder?.record()
        status = .recording
    }
    
    func stop(){
        audioRecorder?.stop()
        status = .stopped
    }
    
}


enum AudioStatus : Int, CustomStringConvertible{
    
    case stopped,
        playing,
        recording
    
    var audioName: String{
        let audioNames = ["Stopped", "Playing", "Recording"]
        return audioNames[rawValue]
    }
    
    var description: String{
        audioName
    }
    
    
}
