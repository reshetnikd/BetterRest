//
//  ContentView.swift
//  BetterRest
//
//  Created by Dmitry Reshetnik on 23.01.2020.
//  Copyright © 2020 Dmitry Reshetnik. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var wakeUp = Date()
    @State private var sleepAmount = 8.0
    @State private var coffeAmount = 1
    
    var body: some View {
        NavigationView {
            VStack {
                Text("When do you want to wake up?")
                    .font(.headline)
                
                DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                
                Text("Desired amount of sleep")
                    .font(.headline)
                
                Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                    Text("\(sleepAmount, specifier: "%g") hours")
                }
                
                Text("Daily coffe intake")
                    .font(.headline)
                
                Stepper(value: $coffeAmount, in: 1...20) {
                    if coffeAmount == 1 {
                        Text("1 cup")
                    } else {
                        Text("\(coffeAmount) cups")
                    }
                }
            }
        }
        .navigationBarTitle("BetterRest")
        .navigationBarItems(trailing:
            Button(action: calculateBedtime) {
                Text("Calculate")
            }
        )
    }
    
    func calculateBedtime() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
