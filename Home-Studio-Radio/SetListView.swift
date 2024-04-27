//
//  SetListView.swift
//  Home-Studio-Radio
//
//  Created by Carlos Mbendera on 26/04/2024.
//

import SwiftUI

struct SetListView: View {
    var body: some View {
        HStack{
            
            Image(systemName: "radio")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text("Let's Make Some Cool Music")
                .font(.title)
                .fontWeight(.bold)
            
            Image(systemName: "radio")
                .imageScale(.large)
                .foregroundStyle(.tint)
        }
        .padding()
        .navigationTitle("Set List")
    }
}

#Preview {
    SetListView()
}
