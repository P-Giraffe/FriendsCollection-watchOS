//
//  ContentView.swift
//  FriendsCollection-watchOSApp Extension
//
//  Created by Johan Guenaoui on 05/05/2021.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        List {
            NavigationLink(destination: MainContent(_season: 0, _mainCharacters: 0).navigationTitle("All Characters")) {
                Label("All Characters", systemImage: "person.3")
            }
            Section(header:Text("Seasons")) {
                ForEach(1...10, id:\.self) {number in
                    NavigationLink(destination: MainContent(_season: number, _mainCharacters: 0).navigationTitle("Season \(number)")) {
                        Label("Season \(number)", systemImage: "tv")
                    }
                }
            }
            Section(header:Text("Type")) {
                NavigationLink(destination: MainContent(_season: -1, _mainCharacters: 1).navigationTitle("Main Characters")) {
                    Label("Main", systemImage: "star.circle.fill")
                }
                NavigationLink(destination: MainContent(_season: -1, _mainCharacters: 2).navigationTitle("Guest")) {
                    Label("Guests", systemImage: "info.circle.fill")
                }
            }
        }
        .listStyle(EllipticalListStyle())
    }
}

struct MainContent: View {
    let _season:Int
    let _mainCharacters:Int
    @ObservedObject private var _friendsCollection = CharacterDirectory()
    
    var body: some View {
        List(_friendsCollection.filter(season: _season, main: _mainCharacters), id: \._id) {value in
                CharacterPresenter(content:value)
        }
        .listStyle(CarouselListStyle())
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            Menu().navigationTitle("Friends Collection")
            MainContent(_season: 0, _mainCharacters: 0).navigationTitle("All Characters")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
