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
                
                if itemDes.name == "Home"{
                    HomeView()
                }
                    
                if itemDes.name == "Record Audio"{
                    VoiceMode()
                }
                
                if itemDes.name == "Set List"{
                    SetListView()
                }
                
                
                
            }
            
            
        }detail: {
            HomeView()
        }
        .navigationTitle(currentView)
        
        
        
        
    }
}

struct NavItem: Hashable, Identifiable{
    var id = UUID()
    var name : String
    var iconName : String
    
    
    static func defaultOptions() -> [NavItem]{
        var items = [NavItem]()
        
        let home = NavItem(name: "Home",
                           iconName: "house")
        
        let audio = NavItem(name: "Record Audio",
                            iconName: "mic")
        
        let setList = NavItem(name: "Set List",
                              iconName: "radio")
        
        items = [home, audio,setList]
        
        return items
    }
}

struct NavView: View {
    
    var item: NavItem
    
    
    var body: some View {
        HStack{
            Image(systemName: item.iconName)
                .foregroundColor(.accentColor)
            Text(item.name)
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
