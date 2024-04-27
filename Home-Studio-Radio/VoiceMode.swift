//
//  VoiceMode.swift
//  Home-Studio-Radio
//
//  Created by Carlos Mbendera on 26/04/2024.
//

import SwiftUI

struct VoiceMode: View {
    var body: some View {
    
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
        .padding()
        .navigationTitle("Record Audio")
    }
}

#Preview {
    VoiceMode()
}
