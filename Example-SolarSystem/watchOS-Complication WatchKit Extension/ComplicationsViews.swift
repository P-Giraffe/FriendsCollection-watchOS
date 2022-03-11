//
//  ComplicationsViews.swift
//  watchOS-Complication WatchKit Extension
//
//  Created by Johan Guenaoui on 19/05/2021.
//

import SwiftUI
import ClockKit

@available(watchOSApplicationExtension 8.0, *)
struct ComplicationGaugeSolarSystem: View {
    @Environment(\.isLuminanceReduced) var isLuminanceReduced
    @Environment(\.complicationRenderingMode) var renderingMode
    let solarSystem = SolarSystem()
    
    var body: some View {
        VStack {
            if !isLuminanceReduced {
                HStack {
                    Image(systemName: "sun.max.fill")
                        .foregroundColor(.yellow)
                    Text("\(solarSystem.getCountPlanet(status: "far")) planets > 5 UA")
                        .complicationForeground()
                }
            }
            
            switch(renderingMode) {
            case .fullColor:
                Gauge(value: Double(solarSystem.getCountPlanet(status: "far")), in: 0...9){
                    Image(systemName: "sun.max.fill")
                        .foregroundColor(.yellow)
                } currentValueLabel: {
                    Text("\(solarSystem.getCountPlanet(status: "far"))")
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("9")
                }
                .gaugeStyle(LinearGaugeStyle(tint: Gradient(colors: [.blue, .purple, .green, .yellow, .orange, .red])))
                .opacity(isLuminanceReduced ? 0.5 : 1.0)
            case .tinted:
                Gauge(value: Double(solarSystem.getCountPlanet(status: "far")), in: 0...9){
                    Image(systemName: "sun.max.fill")
                        .foregroundColor(.yellow)
                } currentValueLabel: {
                    Text("\(solarSystem.getCountPlanet(status: "far"))")
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("9")
                }
                .gaugeStyle(LinearGaugeStyle(tint: Gradient(colors: [.clear, .white])))
                .opacity(isLuminanceReduced ? 0.5 : 1.0)
            default:
                Gauge(value: Double(solarSystem.getCountPlanet(status: "far")), in: 0...9){
                    Image(systemName: "sun.max.fill")
                        .foregroundColor(.yellow)
                } currentValueLabel: {
                    Text("\(solarSystem.getCountPlanet(status: "far"))")
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("9")
                }
                .gaugeStyle(LinearGaugeStyle(tint: Gradient(colors: [.blue, .purple, .green, .yellow, .orange, .red])))
                .opacity(isLuminanceReduced ? 0.5 : 1.0)
            }
        }
    }
}

@available(watchOSApplicationExtension 8.0, *)
struct ComplicationsViews_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CLKComplicationTemplateGraphicRectangularFullView (
                ComplicationGaugeSolarSystem()
            ).previewContext()
            CLKComplicationTemplateGraphicRectangularFullView (
                ComplicationGaugeSolarSystem().environment(\.isLuminanceReduced, true)
            ).previewContext()
        }
    }
}
