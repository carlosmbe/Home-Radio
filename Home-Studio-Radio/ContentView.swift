//
//  ContentView.swift
//  Home-Studio-Radio
//
//  Created by Carlos Mbendera on 16/04/2024.
//

import SwiftUI

struct ContentView: View {
    
    
    private var options = NavItem.defaultOptions()
    
    @State private var currentView = "Home"
    
    var body: some View {
        
        NavigationSplitView{
            
            List(options, id: \.self, selection: $currentView){ option in
                NavigationLink(value: option){
                    NavView(item: option)
                }
            }//List Ends Here
            .navigationDestination(for: NavItem.self){ itemDes in
                
                if itemDes.enumOption == .home{
                    HomeView()
                }
                    
                if itemDes.enumOption == .voiceMode{
                    VoiceMode()
                }
                
                if itemDes.enumOption == .setList{
                    SetListView()
                }
                
                
                
            }
            
            
        }detail: {
            HomeView()
        }
        .navigationTitle(currentView)
        
        
        
        
    }
}


#Preview {
    ContentView()
}
