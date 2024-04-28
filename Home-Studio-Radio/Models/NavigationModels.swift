//
//  Models.swift
//  Home-Studio-Radio
//
//  Created by Carlos Mbendera on 28/04/2024.
//

import Foundation
import SwiftUI


enum NavOptions{
    case home, setList, voiceMode
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

struct NavItem: Hashable, Identifiable{
    var id = UUID()
    var name : String
    var iconName : String
    var enumOption : NavOptions
    
    static func defaultOptions() -> [NavItem]{
        var items = [NavItem]()
        
        let home = NavItem(name: "Home",
                           iconName: "house",
                           enumOption: .home)
        
        let audio = NavItem(name: "Record Audio",
                            iconName: "mic",
                            enumOption: .voiceMode)
        
        let setList = NavItem(name: "Set List",
                              iconName: "radio",
                              enumOption: .setList)
        
        items = [home, audio,setList]
        
        return items
    }
}

