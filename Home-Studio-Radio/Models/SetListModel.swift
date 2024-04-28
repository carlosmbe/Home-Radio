//
//  SetListModel.swift
//  Home-Studio-Radio
//
//  Created by Carlos Mbendera on 28/04/2024.
//

import AVFoundation
import Foundation
import iTunesLibrary

struct SetMusicTrack : Hashable{
    var name : String
    var artist : String
    var location : URL?
}

class SetListPlaylistInfo : ObservableObject{
    
    @Published var currentPlaylist : String
    @Published var trackNames : [String]
    
    init(currentPlaylist: String = "" , trackNames: [String] = [String]()) {
        self.currentPlaylist = currentPlaylist
        self.trackNames = trackNames
    }
    
    static func getPlaylistsData(for playlistName: String?) -> [SetMusicTrack]{
        
        let library = try! ITLibrary(apiVersion: "1.1")
        let playlists = library.allPlaylists
        
        var musicTracks = [SetMusicTrack]()
        
        //Checking in playListName is Nil
        guard let funcPlaylistName = playlistName else{
            print("Playlist Name is Nil")
            return musicTracks
        }
        
        //Find the playlist
        var targetPlaylist: ITLibPlaylist {
            for item in playlists{
                if item.name == funcPlaylistName{
                    return item
                }
            }
            return playlists[0] //Just in case in the loop fails
        }
        
        //Get the location and details of each song
        for song in targetPlaylist.items{
            let currentSMT = SetMusicTrack(name: song.title,
                                           artist: (song.artist?.name ?? song.album.albumArtist) ?? song.composer,
                                           location: song.location)
            
            musicTracks.append(currentSMT)
            
        }
        
        return musicTracks
        
    }
    
    static func getAllPlaylistNames() -> [String]{
        
        let playlists = try! ITLibrary(apiVersion: "1.1").allPlaylists
        return playlists.compactMap{ $0.name }
    }
    
}

extension AVMutableCompositionTrack{
    
    func append(url : URL){
        
        let newAsset = AVURLAsset(url: url)
        
        let range = CMTimeRange(start: CMTime.zero, duration: newAsset.duration)
        
        let end = timeRange.end
        
        if let track = newAsset.tracks(withMediaType: AVMediaType.audio).first{
            try! insertTimeRange(range, of: track, at: end)
        }else{
            print("ERROR! Append Audio Track Issue")
        }
        
        
    }
    
}
