//
//  HomeView.swift
//  Home-Studio-Radio
//
//  Created by Carlos Mbendera on 26/04/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        HStack{
            
            Image(systemName: "waveform")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text("Let's Make Something Really Cool")
                .font(.title)
                .fontWeight(.bold)
            
            Image(systemName: "waveform")
                .imageScale(.large)
                .foregroundStyle(.tint)
        }
    }
}

#Preview {
    HomeView()
}
