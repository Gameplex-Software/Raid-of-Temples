//
//  ContentView.swift
//  Raid Of Temples Launcher
//
//  Created by Tristan Poland on 12/6/21.
//

import SwiftUI

struct Option: Hashable {
    let title: String
    let imageName: String
}

struct ContentView: View {
    @State var currentOption = 0
    let options: [Option] = [
        .init(title: "Launch", imageName: "play"),
        .init(title: "Options", imageName: "gear"),
    ]
    var body: some View {
        NavigationView {
            ListView(options: options, currentSelection: $currentOption)
                .frame(width: 150)
            
            switch currentOption {
            case 1:
                Text("Settings")
            default:
                MainView().frame(minWidth: 800, minHeight: 550 )
            }
        }.toolbar {
            ToolbarItem(placement: .navigation) {
                Button(action: toggleSidebar, label: { // 1
                    Image(systemName: "sidebar.leading")
                })
            }
        }
    }
}

func toggleSidebar() { // 2
    #if os(iOS)
    #else
    NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    #endif
}

struct ListView: View {
    let options: [Option]
    @Binding var currentSelection: Int
    var body: some View {
        VStack {
            let current = options[currentSelection]
            ForEach(options, id: \.self) {Option in
                HStack {
                    Image(systemName: Option.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30 )
                        .frame(alignment: .top)
                    Text(Option.title)
                        .foregroundColor(current == Option ? Color.blue : Color.white)
                }
                    .padding()
                    .onTapGesture {
                        if currentSelection == 1 {
                        currentSelection = 0
                        } else {
                            currentSelection = 1
                    }
                }
            }
        }
    }
}
    
struct MainView: View {
    var body: some View {
        VStack( spacing: 0){
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Start your adventure today")
        }
        .padding(.bottom, 500)
        .background(
            Image("bg")
            .resizable()
            .scaledToFill()
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
            
    }
}
