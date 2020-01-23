//
//  ContentView.swift
//  BetterRest
//
//  Created by Dmitry Reshetnik on 23.01.2020.
//  Copyright © 2020 Dmitry Reshetnik. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date()
    
    func showDateRange() {
        // when you create a new Date instance it will be set to the current date and time
        let now = Date()
        
        // create a second Date instance set to one day in seconds from now
        let tomorrow = Date().addingTimeInterval(86400)
        
        // create a range from those two
        let range = now...tomorrow
        
        print(range)
    }
    
    
    func showDateComponents() {
//        var components = DateComponents()
//        components.hour = 8
//        components.minute = 0
//        let date = Calendar.current.date(from: components) ?? Date()
//        print(date)
        let someDate = Date()
        let components = Calendar.current.dateComponents([.hour, .minute], from: someDate)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let dateString = formatter.string(from: Date())
    }
    
    var body: some View {
        VStack {
            Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                Text("\(sleepAmount, specifier: "%.2f") hours")
            }
            
//            Form {
//                DatePicker("", selection: $wakeUp)
//            }
            
            DatePicker("Please enter a date", selection: $wakeUp, /* displayedComponents: .hourAndMinute */ in: Date()...)
                .labelsHidden()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
