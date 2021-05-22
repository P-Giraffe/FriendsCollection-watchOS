//
//  ComplicationsViews.swift
//  FriendsCollection-watchOSApp Extension
//
//  Created by Johan Guenaoui on 20/05/2021.
//

import SwiftUI
import ClockKit

struct ComplicationGaugeFriendsCollection: View {
    @Environment(\.complicationRenderingMode) var renderingMode
    let friendsCollection = CharacterDirectory()
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.3.fill")
                    .foregroundColor(.blue)
                Text("\(friendsCollection.getNbMainCharacters()) friends / \(friendsCollection.getNbCharacters()) characters")
                    .complicationForeground()
            }
            switch(renderingMode) {
            case .fullColor:
                Gauge(value:Double(friendsCollection.getNbMainCharacters()), in: 0...Double(friendsCollection.getNbCharacters())) {
                    Image(systemName:"person.3.fill")
                        .foregroundColor(.blue)
                } currentValueLabel: {
                    Text("\(friendsCollection.getNbMainCharacters())")
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("\(friendsCollection.getNbCharacters())")
                }
                .gaugeStyle(LinearGaugeStyle(tint: Gradient(colors: [.blue, .purple, .green, .yellow, .orange, .red]))
                )
            case .tinted:
                Gauge(value:Double(friendsCollection.getNbMainCharacters()), in: 0...Double(friendsCollection.getNbCharacters())) {
                    Image(systemName:"person.3.fill")
                        .foregroundColor(.blue)
                } currentValueLabel: {
                    Text("\(friendsCollection.getNbMainCharacters())")
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("\(friendsCollection.getNbCharacters())")
                }
                .gaugeStyle(LinearGaugeStyle(tint: Gradient(colors: [.clear, .white]))
                )
            default:
                Gauge(value:Double(friendsCollection.getNbMainCharacters()), in: 0...Double(friendsCollection.getNbCharacters())) {
                    Image(systemName:"person.3.fill")
                        .foregroundColor(.blue)
                } currentValueLabel: {
                    Text("\(friendsCollection.getNbMainCharacters())")
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("\(friendsCollection.getNbCharacters())")
                }
                .gaugeStyle(LinearGaugeStyle(tint: Gradient(colors: [.blue, .purple, .green, .yellow, .orange, .red]))
                )
            }
            
        }
    }
}

struct ComplicationsViews_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CLKComplicationTemplateGraphicRectangularFullView(
                ComplicationGaugeFriendsCollection()).previewContext()
            
            CLKComplicationTemplateGraphicRectangularFullView(
                ComplicationGaugeFriendsCollection()).previewContext(faceColor: .red)
        }
    }
}
