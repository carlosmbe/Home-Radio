//
//  SetListView.swift
//  Home-Studio-Radio
//
//  Created by Carlos Mbendera on 26/04/2024.
//

import SwiftUI

struct SetListView: View {
    
    @State private var showPlaylistPickerPopover = true
    
    @State private var setTracks = [SetMusicTrack]()
    
    @State private var currentPlaylist = "Click Me To Pick A Playlist"
   
    private let choices = SetListPlaylistInfo.getAllPlaylistNames()
    
    var playlistPicker : some View{
        Picker("Pick a Playlist", selection: $currentPlaylist){
            ForEach(choices, id:\.self) {
                Text($0)
            }
        }
        .onChange(of: currentPlaylist) {
            setTracks = SetListPlaylistInfo.getPlaylistsData(for: $0)
        }
        
        .popover(isPresented: $showPlaylistPickerPopover, arrowEdge: .bottom){
            Text("Click Here To Pick A Playlist")
                .font(.headline)
                .padding()
        }
    }
    
    var body: some View {
        VStack {
            
            List(setTracks, id: \.self){
                Text($0.name)
            }
            
            
        }
        .toolbar{   playlistPicker  }
        .navigationTitle("Set List - Let's Make Some Cool Music ")
        
    }
}





#Preview {
    SetListView()
}
