//
//  VoiceMode.swift
//  Home-Studio-Radio
//
//  Created by Carlos Mbendera on 26/04/2024.
//


import SwiftUI

struct VoiceMode: View {
    
    @ObservedObject private var audioBox = AudioBox()
    
    @State var isRecording = false
    
    var body: some View {
      
        
        VStack{
            VoiceHeaderView()

            RecordStopButtons()
            
            Button("Open CAF File"){
                NSWorkspace.shared.open(audioBox.URLForRec)
            }
            
        }
        .onAppear{
            audioBox.setUpRecorder()
        }
        .padding()
        .navigationTitle("Record Audio")
    }
    
    
    private func RecordStopButtons() -> some View{
        
        Button(action: {
            if isRecording{
                isRecording.toggle()
                audioBox.stop()
            }else{
                isRecording.toggle()
                audioBox.record()
            }
        })
        {
            Image(systemName: isRecording ? "stop.circle" : "mic.circle")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(isRecording ? .red : .green)
        }
        
    }
    
    private func VoiceHeaderView() -> some View{
        HStack{
            
            Image(systemName: "mic")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text("Tell Me a Story")
                .font(.title)
                .fontWeight(.bold)
            
            Image(systemName: "mic")
                .imageScale(.large)
                .foregroundStyle(.tint)
        }
    }
    
    
    
    
}

#Preview {
    VoiceMode()
}
